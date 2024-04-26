import 'package:flutter/material.dart';
import 'package:gradgigs/view/authentication/login.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/view/user_profile/rec_profile.dart';

// ignore_for_file: prefer_const_constructors

class RecruiterRoleInfo extends StatefulWidget {
  // RecruiterBasicInformation(Key? key, this.email, this.fullName, this.username)
  //     : super(key: key);

  // final String email;
  // final String fullName;
  // final String username;

  RecruiterRoleInfo();

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  @override
  State<RecruiterRoleInfo> createState() =>
      _RecruiterRoleInfoState();
}

class _RecruiterRoleInfoState extends State<RecruiterRoleInfo> {
  late RecruiterRoleInfo _model;

  String? selectedNationality;

  @override
  void initState() {
    super.initState();

    _model = RecruiterRoleInfo();

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
          toolbarHeight: 60,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecruiterProfilePage(),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Center(
              child: Container(
                height: 800,
                width: 450,
                decoration: BoxDecoration(
                  color: Color(0xFF5C001F),
                  borderRadius: BorderRadius.circular(20),
                ),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Full Name',
                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------STUDENT/STAFF EMAIL----------------------------------//

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Student/Staff Email',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  //labelStyle: TextStyle(color: Colors.white),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Color.fromARGB(255, 153, 143, 143),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Color(0xFFE4BA70),
                                      ),
                                  filled: true, // Add this line
                                  fillColor: Colors.white, // Set the background color to white
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:  Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    //----------------------------FULL NAME----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Faculty',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Color.fromARGB(255, 153, 143, 143),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Colors.white,
                                      ),
                                  filled: true, // Add this line
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                     color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                          color: Colors.white,
                                        ),
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    //----------------------------CLUBS AND ORGANISATION----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Clubs and Organisation',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: TextFormField(
                                controller: _model.textController3,
                                focusNode: _model.textFieldFocusNode3,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Color.fromARGB(255, 153, 143, 143),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Colors.white,
                                      ),
                                  filled: true, // Add this line
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFB5F69),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                validator: _model.textController3Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    //----------------------------POSITION----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                          child: Text(
                            'Position',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: DropdownButtonFormField<String>(
                          value: selectedNationality,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), // Adjust border radius here
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        color: Color.fromARGB(255, 153, 143, 143),
                                      ),
                            fillColor: Colors.white, // Add this line
                            filled: true, 
                          ),
                          items: ["Lecturer", "Postgraduate Students", "Club/Organisation Representative"].map((String value) {
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
                              return 'Please Choose a Position';
                            }
                            return null; //if input
                          },
                        )),
                
                    //------------------------------BUTTONS---------------------------------//
                
                    // Generated code for this Row Widget...
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 10, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Cancel',
                            options: FFButtonOptions(
                              width: 160,
                              height: 40,
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 16, 20, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Confirm',
                            options: FFButtonOptions(
                              width: 160,
                              height: 40,
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFFE4BA70),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
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
