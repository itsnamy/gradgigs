//Page displaying list of the applicant applied for the job
import 'package:flutter/material.dart';
import 'package:gradgigs/model/rec_job_model.dart';

class RecruiterApplicantList extends StatefulWidget {
  const RecruiterApplicantList(
      {super.key, required RecruiterJobUploadModel job});

  @override
  State<RecruiterApplicantList> createState() => _RecruiterApplicantListState();
}

class _RecruiterApplicantListState extends State<RecruiterApplicantList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
