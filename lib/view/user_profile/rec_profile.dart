import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:gradgigs/view/authentication/rec_signup.dart';
import 'package:gradgigs/view/user_profile/rec_basic_information.dart';
import 'package:gradgigs/view/user_profile/rec_role_information.dart';
import 'package:gradgigs/view/user_profile/rec_contact_details.dart';


class RecruiterProfilePage extends StatefulWidget {
  const RecruiterProfilePage(
      {Key? key,
      required this.email,
      required this.password,
      required this.fullName,
      required this.username,
      required this.selectedRole})
      : super(key: key);

  final String email;
  final String password;
  final String fullName;
  final String username;
  final String? selectedRole;

  @override
  State<RecruiterProfilePage> createState() => _RecruiterProfileState();
}

class _RecruiterProfileState extends State<RecruiterProfilePage> {
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
                builder: (context) => const RecruiterSignupPage(role: 'recruiter'),
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
                  onPressed: () => recruiterBasicInformation(context),
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
                  onPressed: () => recruiterRoleInformation(context),
                  child: const Text(
                    'Role Information',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => recruiterContactDetails(context),
                  child: const Text(
                    'Contact Details',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Full Name: ${widget.fullName}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),  // Spacer
                Text(
                  'Email: ${widget.email}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),  // Spacer
                Text(
                  'Username: ${widget.username}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),  // Spacer
                Text(
                  'Selected Role: ${widget.selectedRole ?? 'N/A'}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void recruiterBasicInformation(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => RecruiterBasicInformation()));
}

void recruiterRoleInformation(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => RecruiterRoleInfo()));
}

void recruiterContactDetails(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => RecruiterContactDetails()));
}