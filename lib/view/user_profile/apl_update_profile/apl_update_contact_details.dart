import 'package:flutter/material.dart';
import 'package:gradgigs/model/apl_profile_model.dart';
import 'package:gradgigs/view/user_profile/apl_profile.dart';
import 'package:gradgigs/view/user_profile/apl_update_profile/apl_update_bank_details.dart';
// ignore_for_file: prefer_const_constructors

class ApplicantUpdateContactDetails extends StatefulWidget {
  final ApplicantProfile applicant;
  const ApplicantUpdateContactDetails({super.key, required this.applicant});

  @override
  State<ApplicantUpdateContactDetails> createState() =>
      _ApplicantUpdateContactDetailsState();
}

class _ApplicantUpdateContactDetailsState
    extends State<ApplicantUpdateContactDetails> {
//declare controller
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial value through the controller
    fullnameController.text = widget.applicant.getFullname;
    phoneController.text = widget.applicant.getPhone;
    emailController.text = widget.applicant.getEmail;
  }

  void updateContactDetails() {
    String fullname = fullnameController.text;
    String phone = phoneController.text;
    String email = emailController.text;

    widget.applicant.setFullname = fullname;
    widget.applicant.setPhone = phone;
    widget.applicant.setEmail = email;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ApplicantUpdateBankDetails(applicant: widget.applicant)));
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
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Container(
              height: 270,
              width: 450,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                        child: TextField(
                          controller: TextEditingController(
                              text: widget.applicant.getFullname),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {
                            widget.applicant.setFullname = value;
                          },
                        ),
                      ),
                    ],
                  ),

                  //----------------------------MOBILE NUMBER----------------------------------//

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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: widget.applicant.getPhone),
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
                                      onChanged: (value) {
                                        widget.applicant.setPhone = value;
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
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: widget.applicant.getEmail),
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
                                      onChanged: (value) {
                                        widget.applicant.setEmail = value;
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
