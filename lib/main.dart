import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:gradgigs/view/authentication/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle initialization error
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(91, 0, 31, 0)),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromRGBO(228, 186, 112, 0),
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: false)),
      home: AnimatedSplashScreen(
        backgroundColor: const Color.fromRGBO(228, 186, 112, 0), //change later
        splash: const Center(
          child: SizedBox(child: Text("GradGigs")),
        ),
        nextScreen: const LoginPage(title: 'Sign In'), //login page
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
