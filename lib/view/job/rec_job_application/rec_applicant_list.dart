//Page displaying list of the applicant applied for the job
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/model/job_status_model.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/repository/applicant_repository/applicant_profile_repository.dart';
import 'package:gradgigs/repository/job_repository/job_status_repository.dart';
import 'package:gradgigs/view/job/rec_job_application/rec_applicant_detail.dart';

class RecruiterApplicantList extends StatefulWidget {
  final RecruiterJobUploadModel job;
  const RecruiterApplicantList({super.key, required this.job});

  @override
  State<RecruiterApplicantList> createState() => _RecruiterApplicantListState();
}

class _RecruiterApplicantListState extends State<RecruiterApplicantList> {
  //get all the applicant applied for the job
  final JobStatusRepository _jopStatus = Get.put(JobStatusRepository());
  late Future<List<ApplicantJobStatus>> _applicantListFuture;
  late Future<ApplicantProfile> applicantDetails;

  @override
  void initState() {
    super.initState();
    _fetchApplicantList();
  }

  void _fetchApplicantList() {
    setState(() {
      _applicantListFuture =
          _jopStatus.getJobDetailsByJobTitle(widget.job.jobTitle);
    });
  }

  Future<ApplicantProfile> _fetchApplicantDetails(aplEmail) async {
    return ApplicantProfileRepository().getApplicant(aplEmail);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<ApplicantJobStatus>>(
            future: _applicantListFuture,
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

  Widget _buildJobCard(ApplicantJobStatus application) {
    return FutureBuilder<ApplicantProfile>(
      future: _fetchApplicantDetails(application.aplEmail),
      builder:
          (BuildContext context, AsyncSnapshot<ApplicantProfile> aplDetails) {
        if (aplDetails.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (aplDetails.hasError) {
          return Text('Error: ${aplDetails.error}');
        } else {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aplDetails.data!.getFullname, // Use the getter here
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email: ${application.aplEmail}', //applicant.faculty,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Faculty: ${aplDetails.data!.getFaculty}', //applicant.faculty,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Status: ${application.jobStatus}', //applicant.faculty,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // Third Section: Arrow Button
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecruiterApplicantDetail(
                                job: widget.job,
                                application: application,
                                aplDetails: aplDetails.data!,
                              ),
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
      },
    );
  }
}
