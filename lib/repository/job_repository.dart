import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:gradgigs/model/rec_job_model.dart';

class JobRepository extends GetxController {
  static JobRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  createJob(RecruiterJobUploadModel job) async {

    String? email = FirebaseAuth.instance.currentUser?.email;
    job.setJobUploaderEmail = email ?? "no email found";

    var imageName = DateTime.now().millisecondsSinceEpoch.toString(); 
    var storageRef = _storage.ref().child('/img/job/$imageName.jpg'); 

    File coverImageFile = File(job.getJobCoverImage.path);

    var uploadTask = storageRef.putFile(coverImageFile); 
    var downloadUrl = await (await uploadTask).ref.getDownloadURL(); 
    job.setJobCoverImageURL = downloadUrl;
    // job.setJobCoverImageURL = 'https://firebasestorage.googleapis.com/v0/b/gradgigs-eb479.appspot.com/o/img%2Frecruiter%2FtestProfileImage.png?alt=media&token=0160b2b8-56f5-4f9e-adf0-341f9783545c';

    await _db
        .collection("jobs")
        .add(job.toJson())
        .whenComplete(() => Get.snackbar("Success", "Job has been added"));
  }

  Future<RecruiterJobUploadModel> getJobDetails(String jobTitle) async {
    final snapshot = await _db
        .collection("jobs")
        .where("jobTtitle", isEqualTo: jobTitle)
        .get();
    final jobData = snapshot.docs
        .map((e) => RecruiterJobUploadModel.fromSnapshot(e))
        .single;
    return jobData;
  }

  Future<List<RecruiterJobUploadModel>> getAllJobDetails() async {
    final snapshot = await _db.collection("jobs").get();
    final jobData = snapshot.docs
        .map((e) => RecruiterJobUploadModel.fromSnapshot(e))
        .toList();
    return jobData;
  }

  Future<List<RecruiterJobUploadModel>> getAllRecruiterJobs(String recruiterEmail) async {
    final snapshot = await _db.collection("jobs").where("jobUploaderEmail", isEqualTo: recruiterEmail).get();
    final jobData = snapshot.docs
        .map((e) => RecruiterJobUploadModel.fromSnapshot(e))
        .toList();
    return jobData;
  }

  updateJob(String docId, RecruiterJobUploadModel job) async {
    await _db
        .collection("jobs")
        .doc(docId)
        .update(job.toJson())
        .whenComplete(() => Get.snackbar("Success", "Job has been updated"));
  }

  Future<void> deleteJob(String jobId) async {
    try {
      await _db.collection("jobs").doc(jobId).delete();
      // Get.snackbar("Success", "Job has been deleted");
    } catch (error) {
      // Get.snackbar("Error", "Failed to delete job: $error");
    }
  }

  Future<void> incrementNumOfApplicants(String jobId) async {
    try {
      await _db.collection("jobs").doc(jobId).update({
        "numOfApplicants": FieldValue.increment(1),
      });
      Get.snackbar("Success", "Number of applicants has been incremented");
    } catch (error) {
      Get.snackbar("Error", "Failed to increment number of applicants: $error");
    }
  }

  Future<void> decrementNumOfApplicants(String jobId) async {
    try {
      await _db.collection("jobs").doc(jobId).update({
        "numOfApplicants": FieldValue.increment(-1),
      });
      Get.snackbar("Success", "Number of applicants has been incremented");
    } catch (error) {
      Get.snackbar("Error", "Failed to increment number of applicants: $error");
    }
  }
}
