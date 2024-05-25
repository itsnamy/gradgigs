//Page displaying list of job offered by the recruiter to view the application list
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/repository/job_repository.dart';
import 'package:gradgigs/view/job/rec_job_application/rec_applicant_list.dart';

class RecruiterJobApplicationList extends StatefulWidget {
  const RecruiterJobApplicationList({super.key});

  @override
  State<RecruiterJobApplicationList> createState() =>
      _RecruiterJobApplicationListState();
}

class _RecruiterJobApplicationListState
    extends State<RecruiterJobApplicationList> {
  //get all the application list
  final JobRepository _jobRepository = Get.put(JobRepository());
  late Future<List<RecruiterJobUploadModel>> _jobListFuture;

  @override
  void initState() {
    super.initState();
    _fetchJobDetails();
  }

  void _fetchJobDetails() {
    setState(() {
      _jobListFuture = _jobRepository.getAllRecruiterJobs(
          FirebaseAuth.instance.currentUser!.email.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Job List',
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
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<RecruiterJobUploadModel>>(
            future: _jobListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return _buildJobCard(snapshot.data![index]);
                  },
                );
              } else {
                return const Text('No Data Available');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(RecruiterJobUploadModel job) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Second Section: Text
            Flexible(
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
                    job.jobDesc,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Second Section: num of applicant
                Text(
                  'Applicant: ${job.numOfApplicant.toString()}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                // Third Section: Arrow Button
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecruiterApplicantList(job: job),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/* return ListTile(
                      title: Text(snapshot.data![index].jobTitle),
                      subtitle: Text(snapshot.data![index].getJobDesc),
                      trailing: Text(
                          snapshot.data![index].getNumOfApplicant.toString()),
                    ); */