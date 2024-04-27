import 'package:flutter/material.dart';
import 'package:gradgigs/model/req_profile_model.dart';

class RecruiterViewContactDetails extends StatelessWidget {
  //final ReqProfileModel recruiter = ReqProfileModel();
  final ReqruiterProfile recruiter;
  const RecruiterViewContactDetails({Key? key, required this.recruiter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Role Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Mobile Number: ${recruiter.getPhone}'),
            Text('Email: ${recruiter.getEmail}'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}