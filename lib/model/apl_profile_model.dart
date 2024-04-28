class ApplicantProfile{
  String role = "applicant";

  late String email; // - sign up page
  late String phone; // - contact details page

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
  late String bankNumber; // - bank details page

  // tiada lagi 
  // resume - supporting documents page
  // certificates - supporting documents page

  //-------------------email---------------------//
  set setEmail(String email) {
    this.email = email;
  }

  String get getEmail => email;

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

}