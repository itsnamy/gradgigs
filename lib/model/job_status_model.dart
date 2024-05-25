import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradgigs/model/apl_profile_model.dart';

class ApplicantJobStatus extends ApplicantProfile {
  late String _id;
  late String _jobTitle;
  late String _jobSalary;
  late String _aplEmail;
  late String _jobStatus;
  late String _recEmail;

  ApplicantJobStatus({
    required String id,
    required String jobTitle,
    required String jobSalary,
    required String aplEmail,
    required String jobStatus,
    required String recEmail,
  }) {
    _id = id;
    _jobTitle = jobTitle;
    _jobSalary = jobSalary;
    _aplEmail = aplEmail;
    _jobStatus = jobStatus;
    _recEmail = recEmail;
  }

  String get statusId => _id;

  String get jobTitle => _jobTitle;
  set jobTitle(String value) => _jobTitle = value;

  String get jobSalary => _jobSalary;
  set jobSalary(String value) => _jobSalary = value;

  String get aplEmail => _aplEmail;

  set aplEmail(String value) => _aplEmail = value;

  String get jobStatus => _jobStatus;
  set jobStatus(String value) => _jobStatus = value;

  String get recEmail => _recEmail;
  set recEmail(String value) => _recEmail = value;

  factory ApplicantJobStatus.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ApplicantJobStatus(
      id: document.id,
      jobTitle: data["jobTitle"],
      jobSalary: data["jobSalary"],
      aplEmail: data["aplEmail"],
      jobStatus: data["jobStatus"],
      recEmail: data["recEmail"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "jobTitle": _jobTitle,
      "jobSalary": _jobSalary,
      "aplEmail": _aplEmail,
      "jobStatus": _jobStatus,
      "recEmail": _recEmail,
    };
  }
}
