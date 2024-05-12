import 'package:flutter/material.dart';
import 'package:gradgigs/model/req_profile_model.dart';
import 'package:gradgigs/view/home/rec_home.dart';
import 'package:gradgigs/view/job/create_job/job_create1.dart';
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
    SearchPage(),
    JobsPage(),
    UploadPage(),
    MessagePage(),
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
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
            label: 'Message',
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

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Search Page')),
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

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Message Page')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecruiterProfilePage(recruiter: ReqruiterProfile());
  }
}
