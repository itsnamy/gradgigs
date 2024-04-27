import 'package:flutter/material.dart';
import 'package:gradgigs/model/req_profile_model.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/view/user_profile/rec_create_profile/rec_role_information.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterBasicInformation extends StatefulWidget {
  final ReqruiterProfile recruiter;
  const RecruiterBasicInformation({super.key, required this.recruiter});

  @override
  State<RecruiterBasicInformation> createState() =>
      _RecruiterBasicInformationState();
}

class _RecruiterBasicInformationState extends State<RecruiterBasicInformation> {

  final _formkey = GlobalKey<FormState>();
  
  //declare controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  String? selectedNationality;
  String? selectedGender;

  void recruiterBasicInfo() {
    String username = usernameController.text;
    String dob = dobController.text;

    widget.recruiter.setUsername = username;
    widget.recruiter.setDOB = dob;
    widget.recruiter.setGender = selectedGender!;
    widget.recruiter.setNationality = selectedNationality!;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RecruiterRoleInfo(recruiter: widget.recruiter)));
  }

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
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/890/600',
                            width: 150,
                            height: 150,
                            fit: BoxFit.none,
                            alignment: Alignment(0, -1),
                          ),
                        ),
                      ),
                    ),
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
                            widget.recruiter.getFullname,
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
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                controller: usernameController,
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
                                    Validator.validateName(value!),
                                //    textController1Validator.asValidator(context),
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
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                  controller: dobController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
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
                                      Validator.validateDateOfBirth(value!)),
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

                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: DropdownButtonFormField<String>(
                          value: selectedNationality,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Please Choose a nationality",
                          ),
                          items:
                              ["Malaysia", "International"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedNationality = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a nationality';
                            }
                            return null; //if input
                          },
                        )),

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

                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Please Choose a gender",
                          ),
                          items: ["Male", "Female"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a gender';
                            }
                            return null; //if input
                          },
                        )),

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
                                recruiterBasicInfo();
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
