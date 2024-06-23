import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/rec_profile_model.dart';

class RecruiterProfileRepository extends GetxController {
  static RecruiterProfileRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createRecruiter(RecruiterProfile recruiter) async {
    await _db
        .collection("recruiter")
        .add(recruiter.toJson())
        .whenComplete(() => Get.snackbar("Success", "Account has been added"));
  }

  Future<RecruiterProfile> getRecruiter(String recruiterEmail) async {
    final snapshot = await _db
        .collection("recruiter")
        .where("recruiterEmail", isEqualTo: recruiterEmail)
        .get();
    final recruiterProfileData =
        snapshot.docs.map((e) => RecruiterProfile.fromSnapshot(e)).single;
    return recruiterProfileData;
  }

  updateRecruiter(String recId, RecruiterProfile recruiter) async {
    await _db
        .collection("recruiter")
        .doc(recId)
        .update(recruiter.toJson())
        .whenComplete(() => Get.snackbar("Success", "User has been updated"));
  }

  Future<String?> getRecruiterNameByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection("recruiter")
          .where("recruiterEmail", isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        return doc["fullname"] as String;
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", "Failed to fetch recruiter name: $error");
      return null;
    }
  }
}
