import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';

class ApplicantBankDetails extends StatefulWidget {
  const ApplicantBankDetails({super.key});

  @override
  State<ApplicantBankDetails> createState() => _ApplicantBankDetailsState();
}

class _ApplicantBankDetailsState extends State<ApplicantBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Academic Information',
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