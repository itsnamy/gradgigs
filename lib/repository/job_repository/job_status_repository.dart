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

    Future<void> deleteJob(String statusId) async {
    try {
      await _db.collection("jobApplication").doc(statusId).delete();
      // Get.snackbar("Success", "Job has been deleted");
    } catch (error) {
      // Get.snackbar("Error", "Failed to delete job: $error");
    }
  }
}
