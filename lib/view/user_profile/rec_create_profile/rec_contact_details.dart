// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradgigs/repository/recruiter_repository/recruiter_profile_repository.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/model/rec_profile_model.dart';
import 'package:gradgigs/view/authentication/login.dart';
// ignore_for_file: prefer_const_constructors

class RecruiterContactDetails extends StatefulWidget {
  final RecruiterProfile recruiter;
  RecruiterContactDetails({super.key, required this.recruiter});

  @override
  State<RecruiterContactDetails> createState() =>
      _RecruiterContactDetailsState();
}

class _RecruiterContactDetailsState extends State<RecruiterContactDetails> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  recruiterContactInfo() {
    String phone = phoneController.text;

    widget.recruiter.setPhone = phone;

    final jobRepo = Get.put(RecruiterProfileRepository());
    jobRepo.createRecruiter(widget.recruiter);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

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
        elevation: 5,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            widget.recruiter.getFullname,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------MOBILE NUMBER----------------------------------//

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Mobile Number',
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                controller: phoneController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) =>
                                    Validator.validatePhoneNumber(value!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------EMAIL----------------------------------//
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
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
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
                                recruiterContactInfo();
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
                    SizedBox(height: 10),

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
