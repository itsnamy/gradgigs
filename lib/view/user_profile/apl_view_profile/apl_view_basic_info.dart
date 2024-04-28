import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/view/user_profile/apl_create_profile/apl_academic_information.dart';
// ignore_for_file: prefer_const_constructors

class ApplicantViewBasicInformation extends StatefulWidget {
  final ApplicantProfile applicant;
  const ApplicantViewBasicInformation({super.key, required this.applicant});

  @override
  State<ApplicantViewBasicInformation> createState() =>
      _ApplicantViewBasicInformationState();
}

class _ApplicantViewBasicInformationState extends State<ApplicantViewBasicInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic information',
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
                    //----------------------------USERNAME----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Username',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                           width: double.infinity,
                                //width: MediaQuery.of(context).size.width-64,
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width-100, // Width of the screen minus padding
                                ),
                           decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            widget.applicant.getUsername,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    //----------------------------DATE OF BIRTH----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Date of Birth',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                           width: double.infinity,
                                //width: MediaQuery.of(context).size.width-64,
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width-100, // Width of the screen minus padding
                                ),
                           decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            widget.applicant.getDOB,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),

                    //----------------------------NATIONALITY----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                          child: Text(
                            'Nationality',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            width: double.infinity,
                                //width: MediaQuery.of(context).size.width-64,
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width-100, // Width of the screen minus padding
                                ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            widget.applicant.getNationality,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),

                    //----------------------------GENDER----------------------------------//

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                          child: Text(
                            'Gender',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            width: double.infinity,
                                //width: MediaQuery.of(context).size.width-64,
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width-100, // Width of the screen minus padding
                                ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            widget.applicant.getgender,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),

                    //------------------------------BUTTONS---------------------------------//

                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 16),
                    //   child: Center(
                    //     child: SizedBox(
                    //       height: 50,
                    //       width: 250,
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           textStyle: const TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //           foregroundColor: Colors.black,
                    //           backgroundColor:
                    //               const Color.fromARGB(255, 228, 185, 112),
                    //           shape: const RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(10)),
                    //           ),
                    //         ),
                    //         child: const Text('Next'),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 30),

                    //---------------------------------END---------------------------------//
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
