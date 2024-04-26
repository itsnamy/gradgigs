import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';

class RecruiterBasicInformation extends StatefulWidget {
  const RecruiterBasicInformation({super.key});

  @override
  State<RecruiterBasicInformation> createState() => _RecruiterBasicInformationState();
}

class _RecruiterBasicInformationState extends State<RecruiterBasicInformation> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    theme: ThemeData(
            /*colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 91, 0, 30)),*/
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 228, 185, 112),
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: false)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sign Up")
      )
    )

    );
    //return const Placeholder();
  }
}