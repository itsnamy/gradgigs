import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/req_profile_model.dart';

class RecruiterProfileRepository extends GetxController{
  static RecruiterProfileRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createRecruiter(ReqruiterProfile recruiter) async{
    await _db.collection("recruiter").add(recruiter.toJson()).whenComplete(() => Get.snackbar("Success", "Account has been added"));
  }
}