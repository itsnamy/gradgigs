import 'package:flutter/src/material/tab_controller.dart';
import 'package:gradgigs/model/req_profile_model.dart';

class RecruiterJobUploadModel extends ReqruiterProfile {
  late String jobTitle;
  late String
      jobDesc; //responsibility, requirement, qualification, experience, skills, benefit
  late String jobCategory; //academic or non-academic
  late String jobLocation; //kalau tak boleh maps, buat text field biasa
  late String jobSalary; //pay per hour
  late String jobStart; //start date
  late String jobEnd; //end date

  //ReqruiterProfile recruiterProfile = ReqruiterProfile();
  //class RecruiterJobUploadModel extends ReqruiterProfile {
  RecruiterJobUploadModel() {
    jobTitle = "Job Title";
    jobDesc = "Job Description";
    jobCategory = "Job Category";
    jobLocation = "Job Location";
    jobSalary = "Job Salary";
    jobStart = "Job Start";
    jobEnd = "Job End";
  } //super(email) untuk test je, nanti kena tukar

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
}
