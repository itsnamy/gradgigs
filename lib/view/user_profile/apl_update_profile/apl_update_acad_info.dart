import 'package:flutter/material.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
import 'package:gradgigs/view/user_profile/apl_update_profile/apl_update_contact_details.dart';
// ignore_for_file: prefer_const_constructors

class ApplicantUpdateAcademicInformation extends StatefulWidget {
  final ApplicantProfile applicant;
  const ApplicantUpdateAcademicInformation(
      {super.key, required this.applicant});

  @override
  State<ApplicantUpdateAcademicInformation> createState() =>
      _ApplicantUpdateAcademicInformationState();
}

class _ApplicantUpdateAcademicInformationState
    extends State<ApplicantUpdateAcademicInformation> {
  final _formkey = GlobalKey<FormState>();
  //declare controller
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial value through the controller
    fullnameController.text = widget.applicant.getFullname;
    emailController.text = widget.applicant.getEmail;
    facultyController.text = widget.applicant.getFaculty;
    collegeController.text = widget.applicant.getCollege;
  }

  void updateAcademicInfoNextStep() {
    String fullname = fullnameController.text;
    String email = emailController.text;
    String faculty = facultyController.text;
    String college = collegeController.text;

    widget.applicant.setFullname = fullname;
    widget.applicant.setEmail = email;
    widget.applicant.setFaculty = faculty;
    widget.applicant.setCollege = college;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ApplicantProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Academic information',
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); //change to navigator.pop(). go to previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF5C001F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //----------------------------FULLNAME DISPLAY----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            widget.applicant.getFullname,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Padding(
                    //       padding:
                    //           EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                    //       child: TextField(
                    //         controller: TextEditingController(
                    //             text: widget.applicant.getFullname),
                    //         decoration: InputDecoration(
                    //           filled: true,
                    //           fillColor: Colors.white,
                    //           contentPadding: EdgeInsets.symmetric(
                    //               vertical: 8, horizontal: 12),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(15),
                    //           ),
                    //         ),
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold),
                    //         onChanged: (value) {
                    //           widget.applicant.setFullname = value;
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //----------------------------STUDENT EMAIL----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Student Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    height: 48,
                                    width: double.infinity,
                                    //width: MediaQuery.of(context).size.width-64,
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context)
                                              .size
                                              .width -
                                          50, // Width of the screen minus padding
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        validator: (value) =>
                                            Validator.validateName(value!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------FACULTY----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Faculty',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    height: 48,
                                    width: double.infinity,
                                    //width: MediaQuery.of(context).size.width-64,
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context)
                                              .size
                                              .width -
                                          50, // Width of the screen minus padding
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: TextFormField(
                                        controller: facultyController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        validator: (value) =>
                                            Validator.validateName(value!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------COLLEGE----------------------------------//

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'College',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    height: 48,
                                    width: double.infinity,
                                    //width: MediaQuery.of(context).size.width-64,
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context)
                                              .size
                                              .width -
                                          50, // Width of the screen minus padding
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: TextFormField(
                                        controller: collegeController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        validator: (value) =>
                                            Validator.validateName(value!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //------------------------------BUTTONS---------------------------------//

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Center(
                        child: SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                updateAcademicInfoNextStep();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please fill input')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  const Color.fromARGB(255, 228, 185, 112),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: const Text('Next'),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    //---------------------------------END---------------------------------//
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
