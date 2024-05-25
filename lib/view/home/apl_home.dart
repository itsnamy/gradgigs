import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/repository/job_repository.dart';
import 'package:gradgigs/view/job/view_job/apl_view_job_details.dart';

class AplicantViewJob extends StatefulWidget {
  AplicantViewJob({Key? key}) : super(key: key);

  @override
  State<AplicantViewJob> createState() =>
      _AplicantViewJobWidgetState();
}

class _AplicantViewJobWidgetState extends State<AplicantViewJob>
    with TickerProviderStateMixin {
  final JobRepository _jobRepository = Get.put(JobRepository());

  @override
  void initState() {
    super.initState();
  }

  // method to compare if start date of job is before current date
  // before = true, after = false
  bool compareDate(String dateString) {
    DateTime currentDate = DateTime.now();

    // Create a DateFormat instance with the expected format
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    // Parse the string to a DateTime object
    DateTime parsedDate = dateFormat.parse(dateString);

    // Compare the parsed date with the current date
    return parsedDate.isBefore(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home Page',
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
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<RecruiterJobUploadModel>>(
            future: _jobRepository.getAllJobDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<RecruiterJobUploadModel> jobDetails = snapshot.data!;
                return ListView.builder(
                  itemCount: jobDetails.length,
                  itemBuilder: (context, index) {
                    final job = jobDetails[index];
                    if (compareDate(job.getJobEnd)) {
                      return SizedBox.shrink(); // Do not build the card if the job has ended
                    }
                    return _buildJobCard(job);
                  },
                );
              } else {
                return Text('No Data Available');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(RecruiterJobUploadModel job) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color.fromARGB(255, 92, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.jobTitle,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 8),
                Text(
                  "RM " + job.getJobSalary + " per hour",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < 4 ? Icons.star : Icons.star_half,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApplicantJobDetailsPage(job: job),
                    ),
                  );
                  },
                  icon: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
