import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';

class RecruiterContactDetails extends StatefulWidget {
  const RecruiterContactDetails({super.key});

  @override
  State <RecruiterContactDetails> createState() => RecruiterContactDetailsState();
}

class RecruiterContactDetailsState extends State<RecruiterContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Details',
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
    );
  }
}