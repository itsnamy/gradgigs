import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'view/authentication/login.dart';

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
          /*colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 91, 0, 30)),*/
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 228, 185, 112),
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: false)),
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromARGB(255, 228, 185, 112), //change later
        splash: const Center(
          child: Image(
            image: AssetImage('assets/gardgigs_logo.jpg'),
            width: 244,
            height: 68,
          ),
        ),
        nextScreen: const LoginPage(title: 'Sign In'), //login page
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
