import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradgigs/model/rec_job_model.dart';
import 'package:gradgigs/service/auth_validator.dart';
import 'package:gradgigs/view/job/create_job/job_create2.dart';
import 'package:image_picker/image_picker.dart';

// ignore_for_file: prefer_const_constructors

class CreateJob1 extends StatefulWidget {
  const CreateJob1({super.key});

  @override
  State<CreateJob1> createState() =>
      _CreateJob1State();
}

class _CreateJob1State extends State<CreateJob1> {

  final _formkey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  RecruiterJobUploadModel job = RecruiterJobUploadModel();
  
  //declare controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  void createJobNextStep() {
    String title = titleController.text;
    String description = descriptionController.text;

    job.setJobTitle = title;
    job.setJobDesc = description;

    job.setJobCoverImage = _image!;

    job = job;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CreateJob2(job: job)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter Job Details',
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
                  
                    //----------------------------TITLE----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Title',
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
                                controller: titleController,
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

                    //----------------------------DESCRIPTION----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Description',
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
                                  controller: descriptionController,
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
                                      Validator.validateName(value!)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //----------------------------IMAGE UPLOAD----------------------------------//
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 16, 16, 0),
                          child: Text(
                            'Cover Image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.file_upload, size: 40, color: Colors.grey),
                            Text('Choose image to upload',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey)),
                            if (_image != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Selected file: ${_image!.name}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        ),
                      ),
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
                                createJobNextStep();
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
