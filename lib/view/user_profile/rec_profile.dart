import 'package:flutter/material.dart';
import 'package:gradgigs/model/req_profile_model.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:gradgigs/view/authentication/rec_signup.dart';
import 'package:gradgigs/view/user_profile/rec_create_profile/rec_contact_details.dart';

import 'rec_view_profile/rec_view_basic_info.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterProfilePage extends StatefulWidget {
  const RecruiterProfilePage({super.key, required ReqruiterProfile recruiter});

  /* final String email;
  final String password;
  final String fullName;
  final String username;
  final String? selectedRole; */

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const RecruiterSignupPage(role: 'recruiter'),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
          child: Center(
            child: Column(children: [
              Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF5C001F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/890/600',
                            width: 150,
                            height: 150,
                            fit: BoxFit.none,
                            alignment: Alignment(0, -1),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Job reqruiter',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () => recruiterBasicInformation(context),
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
                      onPressed: () => recruiterRoleInformation(context),
                      child: const Text(
                        'Role Information',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(),
                    TextButton(
                      onPressed: () => recruiterContactDetails(context),
                      child: const Text(
                        'Contact Details',
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

                    //---------------------------USER DATA-----------------------------//

                    // Text(
                    //   'Full Name: ${widget.fullName}',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Divider(),  // Spacer
                    // Text(
                    //   'Email: ${widget.email}',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Divider(),  // Spacer
                    // Text(
                    //   'Username: ${widget.username}',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Divider(),  // Spacer
                    // Text(
                    //   'Selected Role: ${widget.selectedRole ?? 'N/A'}',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    loginPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
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
            ]),
          ),
        ),
      ),
    );
  }
}

void recruiterBasicInformation(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RecruiterViewBasicInformation())); //navigate to view basic info page
}

void recruiterRoleInformation(BuildContext context) {
  //change to view page
  //Navigator.push(
  //    context, MaterialPageRoute(builder: (context) => RecruiterRoleInfo()));
}

void recruiterContactDetails(BuildContext context) {
  //change to view page
  //Navigator.push(context,
  //    MaterialPageRoute(builder: (context) => RecruiterContactDetails()));
}

void loginPage(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => LoginPage(title: 'Sign In')));
}
