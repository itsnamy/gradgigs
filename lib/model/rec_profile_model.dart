import 'package:cloud_firestore/cloud_firestore.dart';

class RecruiterProfile {
  String role = "recruiter";
  late String id;
  late String email;
  late String phone;
  late String password;

  late String category;
  late String username;
  late String fullname;
  late String dob;
  late String gender;
  late String nationality;

  late String utmMail;
  late String faculty;
  late String orgName;
  late String position;

  RecruiterProfile() {
    email = "recruiter@utm.my";
    phone = "0131013131";
    password = "password";
    category = 'Academician';
    username = 'Umar123';
    fullname = 'Umar bin Ali';
    dob = '03/02/2000';
    gender = 'Male';
    nationality = 'Malaysia';
    utmMail = 'recruiterUTM@utm.my';
    faculty = 'Faculty of Computing';
    orgName = 'Organization';
    position = 'Position';
  }

  //-------------------email---------------------//
  set setEmail(String email) {
    this.email = email;
  }

  String get getEmail => email;

  //-------------------email---------------------//
  set setPassword(String password) {
    this.password = password;
  }

  String get getPassword => password;

  //-------------------phone---------------------//
  set setPhone(String phone) {
    this.phone = phone;
  }

  String get getPhone => phone;

  //-------------------category---------------------//
  set setCategory(String category) {
    this.category = category;
  }

  String get getCategory => category;

  //##################--BASIC INFO--#################//
  //-------------------username---------------------//
  set setUsername(String username) {
    this.username = username;
  }

  String get getUsername => username;

  //-------------------fullname---------------------//
  set setFullname(String fullname) {
    this.fullname = fullname;
  }

  String get getFullname => fullname;

  //-------------------dob---------------------//
  set setDOB(String dob) {
    this.dob = dob;
  }

  String get getDOB => dob;

  //-------------------gender---------------------//
  set setGender(String gender) {
    this.gender = gender;
  }

  String get getgender => gender;

  //-------------------nationality---------------------//
  set setNationality(String nationality) {
    this.nationality = nationality;
  }

  String get getNationality => nationality;

  //##################--ROLE INFO--#################//

  bool checkIfAcademician() {
    if (category == 'Academician') {
      return true;
    } else {
      return false;
    }
  }

  bool checkIfNonAcademician() {
    if (category == 'Non-Academician') {
      return true;
    } else {
      return false;
    }
  }

  //-------------------utmMail---------------------//
  set setUtmMail(String utmMail) {
    this.utmMail = utmMail;
  }

  String get getUtmMail => utmMail;

  //-------------------faculty---------------------//
  set setFaculty(String faculty) {
    this.faculty = faculty;
  }

  String get getFaculty => faculty;

  //-------------------organisation name---------------------//
  set setOrgName(String orgName) {
    this.orgName = orgName;
  }

  String get getOrgName => orgName;

  //-------------------position---------------------//
  set setPosition(String position) {
    this.position = position;
  }

  String get getPosition => position;

  toJson() {
    return {
      "recruiterEmail": email,
      "phone": phone,
      "password": password,
      "category": category,
      "username": username,
      "fullname": fullname,
      "dob": dob,
      "gender": gender,
      "nationality": nationality,
      "utmMail": utmMail,
      "faculty": faculty,
      "orgName": orgName,
      "position": position,
    };
  }

  factory RecruiterProfile.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RecruiterProfile.dataHandling(
      id: document.id,
      email: data["recruiterEmail"],
      phone: data["phone"],
      password: data["password"],
      category: data["category"],
      username: data["username"],
      fullname: data["fullname"],
      dob: data["dob"],
      gender: data["gender"],
      nationality: data["nationality"],
      utmMail: data["utmMail"],
      faculty: data["faculty"],
      orgName: data["orgName"],
      position: data["position"],
    );
  }

  RecruiterProfile.dataHandling({
    required this.id,
    required this.email,
    required this.phone,
    required this.password,
    required this.category,
    required this.username,
    required this.fullname,
    required this.dob,
    required this.gender,
    required this.nationality,
    required this.utmMail,
    required this.faculty,
    required this.orgName,
    required this.position,
  });
}
