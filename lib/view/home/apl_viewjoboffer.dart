import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';

void main() {
  runApp(JobOfferPage());
}

class JobOfferPage extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      title: 'Concert Crew',
      company: 'AKSARA Resak',
      location: 'M01, Pejabat KTDI',
      description:
          'We are seeking a hardworking to join our team in creating a great concert.',
    ),
    Job(
      title: 'Cashier',
      company: 'Pak Atong Enterprise',
      location: 'Angkasa KTDI',
      description:
          'We are looking for a cashier that is good with calculators and numbers.',
    ),
    Job(
      title: 'Chemical Lab Assistant',
      company: 'Faculty of Checmical and Energy',
      location: 'Faculty of Chemical',
      description:
          'Faculty of Checmical and Energy are looking for students who are interested to assist in conducting a few experiments.',
    ),
    Job(
      title: 'Academic Research Assistant',
      company: 'Research & Development UTM',
      location: 'UTM Pagoh',
      description:
          'R & D team are searching for a few students who are interested in assisting a few research projects.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Job Offer',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 5,
        centerTitle: true,
    ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobs[index].title),
            subtitle: Text('${jobs[index].company} - ${jobs[index].location}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailPage(job: jobs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class JobDetailPage extends StatelessWidget {
  final Job job;

  JobDetailPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Job Details',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 5,
        centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${job.company} - ${job.location}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              job.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Job {
  final String title;
  final String company;
  final String location;
  final String description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.description,
  });
}