import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradgigs/service/auth_service.dart';
import 'package:gradgigs/model/rec_profile_model.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:gradgigs/view/user_profile/rec_view_profile/rec_view_contact_details.dart';
import 'package:gradgigs/view/user_profile/rec_view_profile/rec_view_role_info.dart';
import 'package:gradgigs/repository/recruiter_repository/recruiter_profile_repository.dart';

import 'rec_view_profile/rec_view_basic_info.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterProfilePage extends StatefulWidget {
  const RecruiterProfilePage({super.key});

  @override
  State<RecruiterProfilePage> createState() => _RecruiterProfileState();
}

class _RecruiterProfileState extends State<RecruiterProfilePage> {
  final AuthService _authService = AuthService();

  late Future<RecruiterProfile> recruiter2;

  @override
  void initState() {
    super.initState();
    recruiter2 = fetchRecruiterProfile();
  }

  Future<RecruiterProfile> fetchRecruiterProfile() async {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    if (userEmail != null) {
      return await RecruiterProfileRepository().getRecruiter(userEmail);
    } else {
      throw Exception("User is not logged in or email is null.");
    }
  }

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
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<RecruiterProfile>(
        future: recruiter2,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Recruiter profile not found.'));
          } else {
            final recruiter = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color(0xFF5C001F),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              recruiter.getFullname,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Job recruiter',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                              onPressed: () =>
                                  recruiterBasicInformation(context, recruiter),
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
                                  recruiterRoleInformation(context, recruiter),
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
                              onPressed: () =>
                                  recruiterContactDetails(context, recruiter),
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            loginPage(context, _authService);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Color(0xFF5C001F), width: 1),
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
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

void recruiterBasicInformation(
    BuildContext context, RecruiterProfile recruiter) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecruiterViewBasicInformation(
              recruiter: recruiter))); //navigate to view basic info page
}

void recruiterRoleInformation(
    BuildContext context, RecruiterProfile recruiter) {
  //change to view page
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecruiterViewRoleInfo(recruiter: recruiter)));
}

void recruiterContactDetails(BuildContext context, RecruiterProfile recruiter) {
  //change to view page
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RecruiterViewContactDetails(recruiter: recruiter)));
}

Future<void> loginPage(
  BuildContext context,
  AuthService authService,
) async {
  String message = await authService.logOut();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
