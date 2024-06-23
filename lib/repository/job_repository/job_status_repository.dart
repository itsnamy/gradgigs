import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/job_status_model.dart';

class JobStatusRepository extends GetxController {
  static JobStatusRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ApplicantJobStatus>> getAllJobDetails() async {
    final snapshot = await _db.collection("jobApplication").get();
    final jobData =
        snapshot.docs.map((e) => ApplicantJobStatus.fromSnapshot(e)).toList();
    return jobData;
  }

  Future<List<ApplicantJobStatus>> getAllRecruiterJobs(String aplEmail) async {
    final snapshot = await _db
        .collection("jobApplication")
        .where("aplEmail", isEqualTo: aplEmail)
        .get();
    final jobData =
        snapshot.docs.map((e) => ApplicantJobStatus.fromSnapshot(e)).toList();
    return jobData;
  }

  Future<List<ApplicantJobStatus>> getJobDetailsByJobTitle(
      String jobTitle) async {
    final snapshot = await _db
        .collection("jobApplication")
        .where("jobTitle", isEqualTo: jobTitle)
        .get();
    final jobData =
        snapshot.docs.map((e) => ApplicantJobStatus.fromSnapshot(e)).toList();
    return jobData;
  }

  Future<List<ApplicantJobStatus>> getJobDetailsByJobId(String jobId) async {
    final snapshot = await _db
        .collection("jobApplication")
        .where("jobId", isEqualTo: jobId)
        .get();
    final jobData =
        snapshot.docs.map((e) => ApplicantJobStatus.fromSnapshot(e)).toList();
    return jobData;
  }

  Future<void> deleteJob(String statusId) async {
    try {
      await _db.collection("jobApplication").doc(statusId).delete();
      // Get.snackbar("Success", "Job has been deleted");
    } catch (error) {
      // Get.snackbar("Error", "Failed to delete job: $error");
    }
  }

  Future<void> updateJobStatus(String statusId, String status) async {
    try {
      await _db.collection("jobApplication").doc(statusId).update({
        "jobStatus": status,
      });
      // Get.snackbar("Success", "Job status has been updated");
    } catch (error) {
      // Get.snackbar("Error", "Failed to update job status: $error");
    }
  }

  createJobApplication(ApplicantJobStatus jobStatus) async {
    await _db.collection("jobApplication").add(jobStatus.toJson()).whenComplete(
        () => Get.snackbar("Success", "Application has been added"));
  }

  Future<bool> checkApplicationStatus(
      String jobId, String applicantEmail) async {
    bool applicationExists = false;

    try {
      // Perform the query
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("jobApplication")
          .where("jobId", isEqualTo: jobId)
          .where("aplEmail", isEqualTo: applicantEmail)
          .get();

      // Check if any documents are returned
      if (querySnapshot.docs.isNotEmpty) {
        applicationExists = true;
      }
    } catch (e) {
      print("Error getting documents: $e");
    }

    return applicationExists;
  }
}
