import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicantProfile {
  String role = "applicant";

  late String id; //id applicant on firebase
  late String email; // - sign up page
  late String phone; // - contact details page
  late String password;

  late String category; // tukar faculty -sign up page
  late String username; // - sign up page
  late String fullname; // - basic info page
  late String dob; // - basic info page
  late String gender; // - basic info page
  late String nationality; // - basic info page

  late String utmMail; // - academic info page
  late String faculty; // - academic info page
  late String yearProgram; // - academic info page
  late String college; // - academic info page

  late String bankName; // - bank details page
  late String bankHolderName; // - bank details page
  late String bankNumber;

  // tiada lagi
  // resume - supporting documents page
  // certificates - supporting documents page

  ApplicantProfile() {
    setEmail = "example@utm.my";
    setPhone = "123456789";
    setPassword = "password";
    setCategory = "Academician"; // or "Non-Academician"
    setUsername = "username";
    setFullname = "Ali bin Abu";
    setDOB = "01/01/2000";
    setGender = "Male";
    setNationality = "Nationality";
    setUtmMail = "mail@utm.my";
    setFaculty = "Faculty";
    setyearProgram = "Program";
    setCollege = "College";
    setBankName = "Bank";
    setBankHolderName = "Holder";
    setBankNumber = "1234567890";
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

  //-------------------email---------------------//
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

  //-------------------yearProgram---------------------//
  set setyearProgram(String yearProgram) {
    this.yearProgram = yearProgram;
  }

  String get getyearProgram => yearProgram;

  //-------------------college---------------------//
  set setCollege(String college) {
    this.college = college;
  }

  String get getCollege => college;

  //-------------------bankName---------------------//
  set setBankName(String bankName) {
    this.bankName = bankName;
  }

  String get getBankName => bankName;

  //-------------------bankHolderName---------------------//
  set setBankHolderName(String bankHolderName) {
    this.bankHolderName = bankHolderName;
  }

  String get getBankHolderName => bankHolderName;

  //-------------------bankNumber---------------------//
  set setBankNumber(String bankNumber) {
    this.bankNumber = bankNumber;
  }

  String get getBankNumber => bankNumber;

  toJson() {
    return {
      'applicantEmail': email,
      'phone': phone,
      'password': password,
      'category': category,
      'username': username,
      'fullname': fullname,
      'dob': dob,
      'gender': gender,
      'nationality': nationality,
      'utmMail': utmMail,
      'faculty': faculty,
      'yearProgram': yearProgram,
      'college': college,
      'bankName': bankName,
      'bankHolderName': bankHolderName,
      'bankNumber': bankNumber,
    };
  }

  factory ApplicantProfile.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ApplicantProfile.dataHandling(
      id: document.id,
      email: data["applicantEmail"],
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
      yearProgram: data["yearProgram"],
      college: data["college"],
      bankName: data["bankName"],
      bankHolderName: data["bankHolderName"],
      bankNumber: data["bankNumber"],
    );
  }

  ApplicantProfile.dataHandling({
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
    required this.yearProgram,
    required this.college,
    required this.bankName,
    required this.bankHolderName,
    required this.bankNumber,
  });
}
