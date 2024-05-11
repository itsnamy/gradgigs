import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/req_job_model.dart';
import 'package:gradgigs/model/req_profile_model.dart';

class JobRepository extends GetxController{
  static JobRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createJob(RecruiterJobUploadModel job) async{
    await _db.collection("jobs").add(job.toJson()).whenComplete(() => Get.snackbar("Success", "Job has been added"));
  }
}