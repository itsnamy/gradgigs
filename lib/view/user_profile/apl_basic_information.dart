import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';

class ApplicantBasicInformation extends StatefulWidget {
  const ApplicantBasicInformation({super.key});

  @override
  State<ApplicantBasicInformation> createState() => _ApplicantBasicInformationState();
}

class _ApplicantBasicInformationState extends State<ApplicantBasicInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Information',
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