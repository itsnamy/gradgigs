import 'package:flutter/material.dart';

class RecruiterProfilePage extends StatefulWidget {
  const RecruiterProfilePage({Key? key, required this.email, required this.password, required this.fullName, required this.username, required this.selectedRole}) : super(key: key);

  final String email;
  final String password;
  final String fullName;
  final String username;
  final String? selectedRole;

  @override
  State<RecruiterProfilePage> createState() => _RecruiterProfilePageState();
}

class _RecruiterProfilePageState extends State<RecruiterProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Email: ${widget.email}'),
          const SizedBox(height: 8),
          Text('Full Name: ${widget.fullName}'),
          const SizedBox(height: 8),
          Text('Username: ${widget.username}'),
          const SizedBox(height: 8),
          Text('Role: ${widget.selectedRole}'),
          const SizedBox(height: 8),
          
          
          ],
        ),


      )
    );


    // return const Placeholder();
  }
}
