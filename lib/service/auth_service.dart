import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password, String name, String role,
      String category) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (role == "recruiter") {
        await FirebaseFirestore.instance
            .collection('recruiter')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'role': role,
          'category': category,
        });
      } else if (role == "applicant") {
        await FirebaseFirestore.instance
            .collection('applicant')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'role': role,
        });
      }
      return "Sign Up Successfull";
    } catch (e) {
      return "Invalid email or email already in use";
    }
  }

  Future<String> logIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      DocumentSnapshot userDoc;
      final userCollection = FirebaseFirestore.instance.collection('recruiter');
      userDoc = await userCollection.doc(userCredential.user!.uid).get();

      if (!userDoc.exists) {
        final userCollection =
            FirebaseFirestore.instance.collection('applicant');
        userDoc = await userCollection.doc(userCredential.user!.uid).get();
      }

      if (userDoc.exists) {
        return userDoc['role'];
      }
      return "";
    } catch (e) {
      return "Invalid email or password";
    }
  }

  Future<String> logOut() async {
    try {
      await _auth.signOut();
      return "Sign Out Successfull";
    } catch (e) {
      return "Sign Out Failed";
    }
  }

  Future<String> changePassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Email sent";
    } catch (e) {
      return "Failed to send email";
    }
  }

  getApplicant(String email) {
    return FirebaseFirestore.instance
        .collection('applicant')
        .where('email', isEqualTo: email)
        .get();
  }

  getRecruiter(String email) {
    return FirebaseFirestore.instance
        .collection('recruiter')
        .where('email', isEqualTo: email)
        .get();
  }
}
