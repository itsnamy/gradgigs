import 'package:flutter/material.dart';
import 'package:gradgigs/view/home/rec_home.dart';
import 'package:gradgigs/view/job/create_job/job_create1.dart';
import 'package:gradgigs/view/job/rec_job_application/rec_application_list.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';

void main() => runApp(const BottomNavigationBarApp());

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    JobsPage(),
    UploadPage(),
    ApplicationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 91, 0, 30),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Application',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecruiterJobUploadView();
  }
}

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreateJob1();
  }
}

class ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecruiterJobApplicationList();
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecruiterProfilePage();
  }
}
