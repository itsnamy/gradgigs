import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/job_status_model.dart';
import 'package:gradgigs/repository/job_repository/job_status_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AplJobStatus extends StatefulWidget {
  AplJobStatus({Key? key}) : super(key: key);

  @override
  State<AplJobStatus> createState() => _AplJobStatusWidgetState();
}

class _AplJobStatusWidgetState extends State<AplJobStatus> with TickerProviderStateMixin {
  final JobStatusRepository _jobStatusRepository = Get.put(JobStatusRepository());
  late Future<List<ApplicantJobStatus>> _jobDetailsFuture;

  @override
  void initState() {
    super.initState();
    _fetchJobDetails();
  }

  void _fetchJobDetails() {
    setState(() {
      // _jobDetailsFuture = _jobStatusRepository.getAllJobDetails();
      _jobDetailsFuture = _jobStatusRepository.getAllRecruiterJobs(FirebaseAuth.instance.currentUser!.email.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Job Applied',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Color(0xFFE4BA70),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<ApplicantJobStatus>>(
            future: _jobDetailsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<ApplicantJobStatus> jobDetails = snapshot.data!;
                if (jobDetails.isEmpty) {
                  return Text('No Job Applied');
                } else {
                  return ListView.builder(
                    itemCount: jobDetails.length,
                    itemBuilder: (context, index) {
                      return _buildJobCard(jobDetails[index]);
                    },
                  );
                }
              } else {
                return Text('No Data Available');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(ApplicantJobStatus job) {
    Color statusColor;
    switch (job.jobStatus) {
      case 'Pending':
        statusColor = const Color(0xFFE4BA70);
        break;
      case 'Accepted':
        statusColor = Colors.green;
        break;
      case 'Rejected':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.black;
    }
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 80,
                height: 80,
                child: Image.network(
                  'https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.jobTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'RM ${job.jobSalary}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.cancel),
              color: Colors.red,
              onPressed: () async {
                await _jobStatusRepository.deleteJob(job.statusId);
                _fetchJobDetails();
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                job.jobStatus,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
