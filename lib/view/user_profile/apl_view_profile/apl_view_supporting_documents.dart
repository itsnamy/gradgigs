import 'package:flutter/material.dart';
import 'package:gradgigs/view/user_profile/apl_create_profile/apl_bank_details.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
// ignore_for_file: prefer_const_constructors

class ApplicantViewSupportingDocuments extends StatefulWidget {
  final ApplicantProfile applicant;
  ApplicantViewSupportingDocuments({super.key, required this.applicant});

  @override
  State<ApplicantViewSupportingDocuments> createState() => _ApplicantViewSupportingDocumentsState();
}

class _ApplicantViewSupportingDocumentsState extends State<ApplicantViewSupportingDocuments> {

  final _formkey = GlobalKey<FormState>();

  applicantSupportingDocuments() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ApplicantBankDetails(applicant: widget.applicant)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Supporting Documents',
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
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Container(
              height: 370,
              width: 450,
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


                    //----------------------------RESUME----------------------------------//
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color(0xF5F5F5F5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              children: const [
                                Icon(Icons.upload_file, color: Color(0xccCCCCCC)),
                                Text("Upload Resume",
                                    style: TextStyle(color: Color(0xCCCCCCCC)))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //----------------------------CERTIFICATIONS----------------------------------//
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color(0xF5F5F5F5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              children: const [
                                Icon(Icons.upload_file, color: Color(0xccCCCCCC)),
                                Text("Upload Certifications",
                                    style: TextStyle(color: Color(0xCCCCCCCC)))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //------------------------------BUTTONS---------------------------------//

                  //  Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 20, vertical: 16),
                  //     child: Center(
                  //       child: SizedBox(
                  //         height: 50,
                  //         width: 250,
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //             textStyle: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //             foregroundColor: Colors.black,
                  //             backgroundColor:
                  //                 const Color.fromARGB(255, 228, 185, 112),
                  //             shape: const RoundedRectangleBorder(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(10)),
                  //             ),
                  //           ),
                  //           child: const Text('Next'),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
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