import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradgigs/view/authentication/login.dart';

class RecruiterProfile extends StatelessWidget {
  const RecruiterProfile({super.key});

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
                builder: (context) => const LoginPage(title: 'Sign In'),
              ),
            );
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Container(
              height: 600,
              width: 400,
              
              decoration: BoxDecoration(
                color: Colors.brown[400],
                borderRadius: BorderRadius.circular(20),
              ),

              
                child: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      'Full Name',
                      style: TextStyle(
                          fontSize: 24, // Adjust the font size here
                        ),
                    ),
                  ),
                ),
              


            )

        ),



      ),
    );
  }
}