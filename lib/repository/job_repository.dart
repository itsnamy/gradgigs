import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/req_job_model.dart';

class JobRepository extends GetxController {
  static JobRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createJob(RecruiterJobUploadModel job) async {
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

  updateJob(String docId, RecruiterJobUploadModel job) async {
    await _db
        .collection("jobs")
        .doc(docId)
        .update(job.toJson())
        .whenComplete(() => Get.snackbar("Success", "Job has been updated"));
  }
}
