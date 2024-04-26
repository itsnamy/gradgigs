import 'package:flutter/material.dart';

class RecruiterSignupPage extends StatefulWidget {
  final String role;
  const RecruiterSignupPage({super.key, required this.role});

  @override
  State<RecruiterSignupPage> createState() => _RecruiterSignupPageState();
}

//body container - maroon
// header "Job Recruiter"
// input:
// username
// fulname
// mobile number
// Date of birth
// Nationality - gender
// role - Acedamician-organisation/club
// sign up button
class _RecruiterSignupPageState extends State<RecruiterSignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
