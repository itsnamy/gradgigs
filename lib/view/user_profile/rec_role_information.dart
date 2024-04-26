import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';

class RecruiterRoleInfo extends StatefulWidget {
  const RecruiterRoleInfo({super.key});

  @override
  State<RecruiterRoleInfo> createState() => _RecruiterRoleInfoState();
}

class _RecruiterRoleInfoState extends State<RecruiterRoleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Role information',
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