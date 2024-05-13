import 'package:flutter/material.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/model/req_profile_model.dart';
import 'package:gradgigs/navbar/rec_navbar.dart';
import 'package:gradgigs/service/auth_service.dart';
import 'package:gradgigs/view/authentication/forgot_password.dart';
import 'package:gradgigs/view/authentication/role.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/view/job/create_job/job_create1.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
// ignore_for_file: prefer_const_constructors

class LoginPage extends StatefulWidget {
  final String title;
  late ApplicantProfile? applicant;
  late ReqruiterProfile? recruiter;

  LoginPage({super.key, required this.title});

/*
  // Constructor for Applicant
  const LoginPage.forApplicant(
      {super.key, required this.title, required this.applicant})
      : recruiter = null;

  // Constructor for Recruiter
  const LoginPage.forRecruiter(
      {super.key, required this.title, required this.recruiter})
      : applicant = null; */

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

  late ApplicantProfile applicant;
  late ReqruiterProfile recruiter;

  Future<void> SignIn(BuildContext context, String email, String password,
      bool signedUp) async {
    String role = await _authService.logIn(email, password);

    if (role == "applicant") {
      signedUp = true;
      showMessage("Welcome, Applicant");
      //applicant = await _authService.getApplicant(email);
      //applicantPage(applicant);
    } else if (role == "recruiter") {
      signedUp = true;
      recruiterPage();
    }

    if (signedUp == false) {
      showInvalidDialog();
    }
  }

  void applicantPage(ApplicantProfile applicant) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ApplicantProfilePage(applicant: applicant)));
  }

  void recruiterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()),
    );
  }

  void showInvalidDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter valid email and password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 5,
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Image(
                image: AssetImage('assets/gradgigs_logo.png'),
                width: 244,
                height: 68,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => Validator.validateEmail(value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: passToggle,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) => Validator.validatePassword(value!),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                    //builder: (context) => const CreateJob1(),
                  ),
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color.fromARGB(255, 91, 0, 30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width:
                  //width: MediaQuery.of(context).size.width-64,
                  MediaQuery.of(context).size.width -
                      50, // Width of the screen minus padding

              child: ElevatedButton(
                onPressed: () {
                  bool signedUp = false;

                  if (_formkey.currentState!.validate()) {
                    String email = emailController.text;
                    String password = passwordController.text;

                    SignIn(context, email, password, signedUp);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill input')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF5C001F), width: 1),
                  ),
                  backgroundColor: Color(0xFF5C001F),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Contrail One',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "No Account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => const RecruiterProfilePage()),
                    //     );
                    //   },
                    //   child: const Text(
                    //     "No Account?",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.blue, // Change the color to your preference
                    //     ),
                    //   ),
                    // ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RoleSignUp()),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 91, 0, 30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
