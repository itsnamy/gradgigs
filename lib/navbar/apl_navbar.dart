import 'package:flutter/material.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
import 'package:gradgigs/view/home/apl_viewjoboffer.dart';

void main() => runApp(const AplBottomNavigationBarApp());

class AplBottomNavigationBarApp extends StatelessWidget {
  const AplBottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AplCustomBottomNavigationBar(),
    );
  }
}

class AplCustomBottomNavigationBar extends StatefulWidget {
  const AplCustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AplCustomBottomNavigationBar> createState() =>
      _AplCustomBottomNavigationBarState();
}

class _AplCustomBottomNavigationBarState extends State<AplCustomBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    SearchPage(),
    JobsPage(),
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
    // return Container(
    //   child: Center(child: Text('Discover Job Page')),
    // );

    return JobOfferPage();
  }
}

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Liked Job Page')),
    );
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
    return ApplicantProfilePage(applicant: ApplicantProfile());
  }
}
