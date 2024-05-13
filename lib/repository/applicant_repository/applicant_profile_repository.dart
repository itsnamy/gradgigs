import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/apl_profile_model.dart';

class ApplicantProfileRepository extends GetxController{
  static ApplicantProfileRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createApplicant(ApplicantProfile applicant) async{
    await _db.collection("applicant").add(applicant.toJson()).whenComplete(() => Get.snackbar("Success", "Account has been added"));
  }
}