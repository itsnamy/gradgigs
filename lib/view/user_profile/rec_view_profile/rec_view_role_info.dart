import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/model/req_profile_model.dart';
import 'package:gradgigs/view/user_profile/rec_create_profile/rec_contact_details.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterViewRoleInfo extends StatefulWidget {
  final ReqruiterProfile recruiter;
  RecruiterViewRoleInfo({super.key, required this.recruiter});

  @override
  State<RecruiterViewRoleInfo> createState() => _RecruiterViewRoleInfoState();
}

class _RecruiterViewRoleInfoState extends State<RecruiterViewRoleInfo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Role information',
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
        elevation: 15,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                    
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            widget.recruiter.getFullname,
                            style:
                                FlutterFlowTheme.of(context).titleLarge.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                
                    if (widget.recruiter.checkIfAcademician())
                      Column(
                        children: [
                          //----------------------------STUDENT STAFF EMAIL----------------------------------//
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                                child: Text(
                                  'Student/Staff Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
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
                            widget.recruiter.getUtmMail,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                          //----------------------------FACULTY----------------------------------//
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                                child: Text(
                                  'Faculty',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
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
                            widget.recruiter.getFaculty,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                        ],
                      ),
                
                    if (widget.recruiter.checkIfNonAcademician())
                      Column(
                        children: [
                          //----------------------------CLUBS AND ORGANISATION----------------------------------//
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                                child: Text(
                                  'Clubs and Organisation',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
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
                            widget.recruiter.getOrgName,
                            style: TextStyle(color: Colors.black),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                        ],
                      ),
                
                    //----------------------------POSITION----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                          child: Text(
                            'Position',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
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
                            widget.recruiter.getPosition,
                            style: TextStyle(color: Colors.black),
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
                                Navigator.pop(context);
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
                    SizedBox(height: 10),
                
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
