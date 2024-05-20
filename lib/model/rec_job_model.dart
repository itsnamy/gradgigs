import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/src/material/tab_controller.dart';
import 'package:gradgigs/model/rec_profile_model.dart';

class RecruiterJobUploadModel extends RecruiterProfile {
  late String id;
  late String jobTitle;
  late String
      jobDesc; //responsibility, requirement, qualification, experience, skills, benefit
  late String jobCategory; //academic or non-academic
  late String jobLocation; //kalau tak boleh maps, buat text field biasa
  late String jobSalary; //pay per hour
  late String jobStart; //start date
  late String jobEnd; //end date

  //RecruiterProfile recruiterProfile = RecruiterProfile();
  //class RecruiterJobUploadModel extends RecruiterProfile {
  RecruiterJobUploadModel() {
    jobTitle = "Job Title";
    jobDesc = "Job Description";
    jobCategory = "Job Category";
    jobLocation = "Job Location";
    jobSalary = "Job Salary";
    jobStart = "Job Start";
    jobEnd = "Job End";
  } //super(email) untuk test je, nanti kena tukar

  RecruiterJobUploadModel.dataHandling(
      {required this.id,
      required this.jobTitle,
      required this.jobDesc,
      required this.jobCategory,
      required this.jobLocation,
      required this.jobSalary,
      required this.jobStart,
      required this.jobEnd});

  //-------------------id---------------------//
  String get getJobId => id;
  //-------------------jobTitle---------------------//
  set setJobTitle(String jobTitle) {
    this.jobTitle = jobTitle;
  }

  String get getJobTitle => jobTitle;

  //-------------------jobDesc---------------------//
  set setJobDesc(String jobDesc) {
    this.jobDesc = jobDesc;
  }

  String get getJobDesc => jobDesc;

  //-------------------jobCategory---------------------//
  set setJobCategory(String jobCategory) {
    this.jobCategory = jobCategory;
  }

  String get getJobCategory => jobCategory;

  //-------------------jobLocation---------------------//
  set setJobLocation(String jobLocation) {
    this.jobLocation = jobLocation;
  }

  String get getJobLocation => jobLocation;

  //-------------------jobSalary---------------------//
  set setJobSalary(String jobSalary) {
    this.jobSalary = jobSalary;
  }

  String get getJobSalary => jobSalary;

  //-------------------jobStart---------------------//
  set setJobStart(String jobStart) {
    this.jobStart = jobStart;
  }

  String get getJobStart => jobStart;

  //-------------------jobEnd---------------------//
  set setJobEnd(String jobEnd) {
    this.jobEnd = jobEnd;
  }

  String get getJobEnd => jobEnd;

  toJson() {
    return {
      "jobTitle": jobTitle,
      "jobDesc": jobDesc,
      "jobCategory": jobCategory,
      "jobLocation": jobLocation,
      "jobSalary": jobSalary,
      "jobStart": jobStart,
      "jobEnd": jobEnd,
    };
  }

  factory RecruiterJobUploadModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RecruiterJobUploadModel.dataHandling(
      id: document.id,
      jobTitle: data["jobTitle"],
      jobDesc: data["jobDesc"],
      jobCategory: data["jobCategory"],
      jobLocation: data["jobLocation"],
      jobSalary: data["jobSalary"],
      jobStart: data["jobStart"],
      jobEnd: data["jobEnd"],
    );
  }
}
