import 'package:flutter/material.dart';
import 'package:gradgigs/model/req_job_model.dart';
import 'package:gradgigs/view/job/update_job/job_update1.dart';
import 'package:gradgigs/repository/job_repository.dart';
// ignore_for_file: prefer_const_constructors

class JobDetailsPage extends StatelessWidget {
  final RecruiterJobUploadModel job;

  const JobDetailsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details"),
      ),
      body: SingleChildScrollView(
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
                    job.jobTitle,
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
                    "${job.getJobStart} - ${job.getJobEnd}",
                  ),
                  SizedBox(height: 8),
                  _buildDetailItem("Pay Per Hour (RM):", job.getJobSalary),
                  SizedBox(height: 8),
                  _buildDetailItem("Location:", job.getJobLocation),
                  SizedBox(height: 8),
                  _buildDetailItem("Description:", job.getJobDesc),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateJob1(job: job),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 91, 0, 30),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text('Update Job'),
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
                          onPressed: () {
                            //delete function
                            JobRepository.instance.deleteJob(job.getJobId);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 248, 66, 66),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text('Delete Job'),
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
