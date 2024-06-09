//Page displaying detail of the applicant applied for the job
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/model/job_status_model.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/repository/job_repository/job_status_repository.dart';
import 'package:gradgigs/view/job/rec_job_application/rec_applicant_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecruiterApplicantDetail extends StatefulWidget {
  final RecruiterJobUploadModel job;
  final ApplicantJobStatus application;
  final ApplicantProfile aplDetails;
  const RecruiterApplicantDetail(
      {super.key,
      required this.application,
      required this.aplDetails,
      required this.job});

  @override
  State<RecruiterApplicantDetail> createState() =>
      _RecruiterApplicantDetailState();
}

class _RecruiterApplicantDetailState extends State<RecruiterApplicantDetail> {
  Future<void> _updateApplication(BuildContext context) async {
    String? name = widget.aplDetails.getFullname;
    String email = widget.aplDetails.getEmail;
    String subject = 'Application for part time at ${widget.job.jobTitle}';
    String? message;
    if (widget.application.jobStatus == "Accepted") {
      message =
          'Congratulations! Your job application for ${widget.job.jobTitle} has been accepted.';
    } else {
      message =
          'We regret to inform you that your application for ${widget.job.jobTitle} has not been successful.';
    }

    final serviceId = 'service_d8vzsmb';
    final templateId = 'template_saewflr';
    final userId = '30CWMDFTO5X7Xg2LR';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applicant Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 91, 0, 30),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      widget.aplDetails.getFullname,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Basic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Date of Birth: ", widget.aplDetails.getDOB),
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Gender: ", widget.aplDetails.getgender),
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Nationality: ", widget.aplDetails.getNationality),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Acedamic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Faculty: ", widget.aplDetails.getFaculty),
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Program: ", widget.aplDetails.getyearProgram),
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Collage: ", widget.aplDetails.getCollege),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        _buildDetailItem("Email: ", widget.aplDetails.getEmail),
                        SizedBox(height: 8),
                        _buildDetailItem(
                            "Phone Number: ", widget.aplDetails.getPhone),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () async {
                            JobStatusRepository.instance.updateJobStatus(
                                widget.application.statusId, "Accepted");
                            await _updateApplication(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecruiterApplicantList(
                                  job: widget.job,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFFE4BA70),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text('Accept Applicant'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () async {
                            //reject applicant
                            JobStatusRepository.instance.updateJobStatus(
                                widget.application.statusId, "Rejected");
                            await _updateApplication(context);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            foregroundColor: Colors.grey[100],
                            backgroundColor: Color.fromARGB(255, 248, 66, 66),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text('Reject Applicant'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
