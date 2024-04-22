import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'rec_signup.dart';
import 'apl_signup.dart';

class RoleSignUp extends StatelessWidget {
  const RoleSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
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
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Image(
                image: AssetImage('assets/gardgigs_logo.jpg'),
                width: 244,
                height: 68,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                'What is Your Role?',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 91, 91),
                  fontFamily: 'Contrail One',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToSignupPage(context, 'recruiter');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 228, 185, 112),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Job Recruiter',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 91, 91),
                        fontFamily: 'Contrail One',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Looking for qualified teamand provide opportunities?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 91, 91),
                        fontFamily: 'Contrail One',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToSignupPage(context, 'applicant');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 228, 185, 112),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Job Applicant',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 91, 91),
                        fontFamily: 'Contrail One',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Eager to gain out of class experience. Academically or non-academically',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 91, 91),
                        fontFamily: 'Contrail One',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            //const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

void _navigateToSignupPage(BuildContext context, String role) {
  switch (role) {
    case 'recruiter':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RecruiterSignupPage(role: 'recruiter'),
        ),
      );
      break;
    case 'applicant':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ApplicantSignupPage(role: 'applicant'),
        ),
      );
      break;
  }
}


// title sighn up
// body: gradgigs logo
//  Whats Your Role?
//  button 1: Job Recruiter
//  button 2: Job Seeker