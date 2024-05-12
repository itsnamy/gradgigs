import 'package:flutter/material.dart';
import 'package:gradgigs/service/auth_service.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/view/user_profile/apl_view_profile/apl_view_acad_info.dart';
import 'package:gradgigs/view/user_profile/apl_view_profile/apl_view_bank_details.dart';
import 'package:gradgigs/view/user_profile/apl_view_profile/apl_view_basic_info.dart';
import 'package:gradgigs/view/user_profile/apl_view_profile/apl_view_supporting_documents.dart';
import 'package:gradgigs/view/user_profile/apl_view_profile/apl_view_contact_details.dart';

// ignore_for_file: prefer_const_constructors

class ApplicantProfilePage extends StatefulWidget {
  final ApplicantProfile applicant;

  const ApplicantProfilePage({super.key, required this.applicant});

  @override
  State<ApplicantProfilePage> createState() => _ApplicantProfilePageState();
}

class _ApplicantProfilePageState extends State<ApplicantProfilePage> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 15,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            String message = await _authService.logOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(title: 'Sign In'),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
              child: Column(children: [
            Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xFF5C001F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.applicant.fullname,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Job seeker',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () =>
                        applicantBasicInformation(context, widget.applicant),
                    child: const Text(
                      'Basic Information',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () =>
                        applicantAcademicInformation(context, widget.applicant),
                    child: const Text(
                      'Academic Information',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () =>
                        applicantContactDetails(context, widget.applicant),
                    child: const Text(
                      'Contact Details',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () =>
                        applicantBankDetails(context, widget.applicant),
                    child: const Text(
                      'Bank Details',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () =>
                        applicantSupportingDocuments(context, widget.applicant),
                    child: const Text(
                      'Supporting Documents',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ), // Spacer
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  loginPage(context, widget.applicant);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF5C001F), width: 1),
                  ),
                  backgroundColor: Color(0xFFF5F5F5),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Log out',
                      style: TextStyle(
                        color: Color.fromARGB(255, 61, 61, 61),
                        fontFamily: 'Contrail One',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}

void applicantBasicInformation(
    BuildContext context, ApplicantProfile applicant) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApplicantViewBasicInformation(applicant: applicant)));
}

void applicantAcademicInformation(
    BuildContext context, ApplicantProfile applicant) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApplicantViewAcademicInformation(applicant: applicant)));
}

void applicantContactDetails(BuildContext context, ApplicantProfile applicant) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApplicantViewContactDetails(applicant: applicant)));
}

void applicantBankDetails(BuildContext context, ApplicantProfile applicant) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApplicantViewBankDetails(applicant: applicant)));
}

void applicantSupportingDocuments(
    BuildContext context, ApplicantProfile applicant) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApplicantViewSupportingDocuments(applicant: applicant)));
}

void loginPage(BuildContext context, ApplicantProfile applicant) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => LoginPage(title: 'Sign In')));
}
