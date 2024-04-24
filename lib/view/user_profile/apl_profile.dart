import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:gradgigs/view/user_profile/apl_academic_information.dart';
import 'package:gradgigs/view/user_profile/apl_bank_details.dart';
import 'package:gradgigs/view/user_profile/apl_basic_information.dart';
import 'package:gradgigs/view/user_profile/apl_supporting_documents.dart';
import 'package:gradgigs/view/user_profile/apl_contact_details.dart';

class ApplicantProfilePage extends StatefulWidget {
  const ApplicantProfilePage({super.key});

  @override
  State<ApplicantProfilePage> createState() => _ApplicantProfilePageState();
}

class _ApplicantProfilePageState extends State<ApplicantProfilePage> {
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
        toolbarHeight: 90,
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(title: 'Sign In'),
              ),
            );
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
        child: Center(
          child: Container(
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.brown[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => applicantBasicInformation(context),
                  child: const Text(
                    'Basic Information',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => applicantAcademicInformation(context),
                  child: const Text(
                    'Academic Information',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => applicantContactDetails(context),
                  child: const Text(
                    'Contact Details',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => applicantBankDetails(context),
                  child: const Text(
                    'Bank Details',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => applicantSupportingDocuments(context),
                  child: const Text(
                    'Supporting Documents',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20), // Spacer
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void applicantBasicInformation(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantBasicInformation()));
}

void applicantAcademicInformation(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantAcademicInformation()));
}

void applicantContactDetails(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantContactDetails()));
}

void applicantBankDetails(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantBankDetails()));
}

void applicantSupportingDocuments(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantSupportingDocuments()));
}