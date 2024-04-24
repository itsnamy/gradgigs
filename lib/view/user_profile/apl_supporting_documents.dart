import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';

class ApplicantSupportingDocuments extends StatefulWidget {
  const ApplicantSupportingDocuments({super.key});

  @override
  State<ApplicantSupportingDocuments> createState() => _ApplicantSupportingDocumentsState();
}

class _ApplicantSupportingDocumentsState extends State<ApplicantSupportingDocuments> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Supporting Documents',
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
                builder: (context) => const ApplicantProfilePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}