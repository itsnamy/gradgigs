import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/repository/job_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradgigs/model/job_status_model.dart';
import 'package:gradgigs/repository/job_repository/job_status_repository.dart';
import 'package:gradgigs/repository/applicant_repository/applicant_profile_repository.dart';
import 'package:gradgigs/repository/recruiter_repository/recruiter_profile_repository.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore_for_file: prefer_const_constructors

class ApplicantJobDetailsPage extends StatefulWidget {
  final RecruiterJobUploadModel job;
  
  const ApplicantJobDetailsPage({super.key, required this.job});

  @override
  State<ApplicantJobDetailsPage> createState() => _ApplicantJobDetailsPageState();
}

class _ApplicantJobDetailsPageState extends State<ApplicantJobDetailsPage> {

  final jobStatusRepo = Get.put(JobStatusRepository());
  final jobRepository = Get.put(JobRepository());
  final recProfile = Get.put(RecruiterProfileRepository());
  // final aplProfileRepository = Get.put(ApplicantProfileRepository());
  // late ApplicantProfile applicantProfile;

  bool applicationExists = false;
  bool isLoading = true;


  Future<void> _submitApplication(BuildContext context) async {
    const String pendingStatus = "Pending";

    ApplicantJobStatus jobApplication = ApplicantJobStatus(
      id: '',
      aplEmail: FirebaseAuth.instance.currentUser!.email.toString(),
      jobSalary: widget.job.getJobSalary,
      jobStatus: pendingStatus,
      jobTitle: widget.job.jobTitle,
      recEmail: widget.job.getJobUploaderEmail,
      jobId: widget.job.getJobId,
    );

    await jobStatusRepo.createJobApplication(jobApplication);
    await jobRepository.incrementNumOfApplicants(widget.job.id);

    String? name = await recProfile.getRecruiterNameByEmail(widget.job.getJobUploaderEmail);
    String email = widget.job.getJobUploaderEmail;
    String subject = 'Application for part time at ${widget.job.jobTitle}';
    String aplEmail = FirebaseAuth.instance.currentUser!.email.toString();
    String message = '$aplEmail wants to apply for this job';

    final serviceId = 'service_d8vzsmb';
    final templateId = 'template_saewflr';
    final userId = '30CWMDFTO5X7Xg2LR';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response =  await http.post(
      url,
      headers:{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params':{
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          },
      }),
      );

    print(response.body);

    // Check application status again to refresh the page
    await _checkApplicationStatus();
  }

  @override
  void initState() {
    super.initState();
    _checkApplicationStatus();
  }

  Future<void> _checkApplicationStatus() async {
    bool status = await jobStatusRepo.checkApplicationStatus(widget.job.getJobId, FirebaseAuth.instance.currentUser!.email!);
    setState(() {
      applicationExists = status;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details"),
      ),
      body: isLoading 
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE4BA70),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.job.jobTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Image.network(
                        "https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16),
                      _buildDetailItem(
                        "Working Hours:",
                        "${widget.job.getJobStart} - ${widget.job.getJobEnd}",
                      ),
                      SizedBox(height: 8),
                      _buildDetailItem("Pay Per Hour (RM):", widget.job.getJobSalary),
                      SizedBox(height: 8),
                      _buildDetailItem("Location:", widget.job.getJobLocation),
                      SizedBox(height: 8),
                      _buildDetailItem("Description:", widget.job.getJobDesc),
                      SizedBox(height: 8),
                      _buildDetailItem("Recruiter email:", widget.job.getJobUploaderEmail),
                      SizedBox(height: 16),
                      if (!applicationExists)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _submitApplication(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(255, 91, 0, 30),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: const Text('Apply Job'),
                              ),
                            ),
                          ),
                        )
                      else 
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () async {}, // Disabled button
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green, // Disabled color
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: const Text('Applied'),
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
    return Column(
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
