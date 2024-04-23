import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';

class RecruiterSignupPage extends StatefulWidget {
  final String role;
  const RecruiterSignupPage({super.key, required this.role});

  @override
  State<RecruiterSignupPage> createState() => _RecruiterSignupPageState();
}

class _RecruiterSignupPageState extends State<RecruiterSignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController uNameController = TextEditingController();
  String? selectedRole;

  void recruiterSignUp() {
    //get details recruiter
    String email = emailController.text;
    String password = pwdController.text;
    String fullName = fNameController.text;
    String username = uNameController.text;

    Navigator.push(context, 
    MaterialPageRoute(builder: (context)=> RecruiterProfilePage(
      email: email,
      password: password,
      fullName: fullName,
      username: username,
      selectedRole: selectedRole


    )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            /*colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 91, 0, 30)),*/
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 228, 185, 112),
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: false)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sign Up"),
          ),
          body: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                //-------------------------------------EMAIL INPUT---------------------------------//
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
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

                //-------------------------------------PASSWORD INPUT---------------------------------//
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: TextFormField(
                    controller: pwdController,
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

                //-------------------------------------FULL NAME INPUT---------------------------------//
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: TextFormField(
                    controller: fNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null; //if input
                    },
                  ),
                ),

                //-------------------------------------USERNAME INPUT---------------------------------//
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: TextFormField(
                    controller: uNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null; //if input
                    },
                  ),
                ),

                //-------------------------------------ROLE INPUT---------------------------------//
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: DropdownButtonFormField<String>(
                    value: selectedRole,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Please Choose a Role",
                    ),

                    items: ["Academician", "Organisation/Club"].map((String value){
                       return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  },

                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a role';
                      }
                      return null; //if input
                    },
                )),
                

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            recruiterSignUp();
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
              ])),
        ));

    // return const Placeholder();
  }
}
