import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:gradgigs/repository/recruiter_repository/recruiter_profile_repository.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/model/rec_profile_model.dart';
import 'package:gradgigs/view/user_profile/rec_create_profile/rec_contact_details.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterUpdateRoleInfo extends StatefulWidget {
  final RecruiterProfile recruiter;
  const RecruiterUpdateRoleInfo({super.key, required this.recruiter});

  @override
  State<RecruiterUpdateRoleInfo> createState() =>
      _RecruiterUpdateRoleInfoState();
}

class _RecruiterUpdateRoleInfoState extends State<RecruiterUpdateRoleInfo> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController recemailController = TextEditingController();
  final TextEditingController recfacultyController = TextEditingController();
  final TextEditingController recorgNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    recemailController.text = widget.recruiter.getUtmMail;
    recfacultyController.text = widget.recruiter.getFaculty;
    recorgNameController.text = widget.recruiter.getOrgName;
  }

  void updaterecRoleInfoNextStep() {
    String email = recemailController.text;
    String faculty = recfacultyController.text;
    String orgName = recorgNameController.text;

    widget.recruiter.setUtmMail = email;
    widget.recruiter.setFaculty = faculty;
    widget.recruiter.setOrgName = orgName;

    final recProfileRepo = Get.put(RecruiterProfileRepository());
    recProfileRepo.updateRecruiter(widget.recruiter.getRecId, widget.recruiter);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RecruiterProfilePage()));
  }

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
        elevation: 5,
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
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.recruiter.checkIfAcademician())
                      Column(
                        children: [
                          //----------------------------STUDENT STAFF EMAIL----------------------------------//
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
                                          'Student/Staff Email',
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
                                            child: TextFormField(
                                              controller: recemailController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
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
                                                  Validator.validateEmail(
                                                      value!),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: TextFormField(
                                              controller: recfacultyController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
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
                                                  Validator.validateFaculty(
                                                      value!),
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

                          if (widget.recruiter.checkIfNonAcademician())
                            Column(
                              children: [
                                //----------------------------CLUBS AND ORGANISATION----------------------------------//
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 16, 0),
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
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 0),
                                          child: TextFormField(
                                            controller: recorgNameController,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 12),
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
                                                Validator.validateClubAndOrg(
                                                    value!),
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
                                          'Position',
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
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                50,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child:
                                                DropdownButtonFormField<String>(
                                              value:
                                                  widget.recruiter.getPosition,
                                              decoration: InputDecoration(
                                                labelStyle: TextStyle(
                                                    color: Colors.white),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 0),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText:
                                                    "Please Choose a position",
                                              ),
                                              items: [
                                                "Lecturer",
                                                "Postgraduate Students",
                                                "Club/Organisation Representative"
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  widget.recruiter.setPosition =
                                                      newValue!;
                                                });
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please select a position';
                                                }
                                                return null;
                                              },
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
                                      updaterecRoleInfoNextStep();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Please fill input')));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color.fromARGB(
                                        255, 228, 185, 112),
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
