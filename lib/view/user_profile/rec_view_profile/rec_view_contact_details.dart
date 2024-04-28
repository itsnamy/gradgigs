import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
// import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/model/req_profile_model.dart';
// import 'package:gradgigs/view/user_profile/rec_create_profile/rec_contact_details.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterViewContactDetails extends StatefulWidget {
  final ReqruiterProfile recruiter;
  RecruiterViewContactDetails({super.key, required this.recruiter});

  @override
  State<RecruiterViewContactDetails> createState() =>
      _RecruiterViewContactDetailsState();
}

class _RecruiterViewContactDetailsState
    extends State<RecruiterViewContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Details',
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
                        //----------------------------MOBILE NUMBER----------------------------------//
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mobile Number',
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Text(
                                            widget.recruiter.getPhone,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                            overflow: TextOverflow.ellipsis,
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
                        //----------------------------Email----------------------------------//
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Text(
                                            widget.recruiter.getEmail,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                            overflow: TextOverflow.ellipsis,
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
