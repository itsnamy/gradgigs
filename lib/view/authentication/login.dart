import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradgigs/view/authentication/forgot_password.dart';
import 'package:gradgigs/view/authentication/role.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';
// ignore_for_file: prefer_const_constructors

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (context) => RoleSignUp());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign in',
            textAlign: TextAlign.center, // Center the text
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
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
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null; //if input
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null; //if input
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color.fromRGBO(48, 63, 159, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: Center(
            //     child: SizedBox(
            //       width: 374, // Same width as the TextFormField
            //       height: 52, // Same height as the TextFormField
            //       child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const ApplicantProfilePage()),
            //           );
            //         },
            //         style: ElevatedButton.styleFrom(
            //           textStyle: const TextStyle(
            //             color: Color.fromRGBO(255, 255, 255, 0.9),
            //             fontWeight: FontWeight.bold,
            //           ),
            //           backgroundColor: const Color.fromRGBO(22, 184, 184, 1),
            //           shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(25)),
            //           ),
            //         ),
            //         child: const Text('Log in'),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  applicantProfilePage(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color:Color(0xFF5C001F),width:1),
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
                          color: Color.fromRGBO(22, 184, 184, 11),
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
void applicantProfilePage(BuildContext context){
  // Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantProfilePage()));
}
