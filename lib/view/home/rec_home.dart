import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/model/req_job_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecruiterJobUploadView extends StatefulWidget {
  final RecruiterJobUploadModel recruiter = RecruiterJobUploadModel();
  RecruiterJobUploadView({Key? key}) : super(key: key);

  @override
  State<RecruiterJobUploadView> createState() =>
      _RecruiterJobUploadViewWidgetState();
}

class _RecruiterJobUploadViewWidgetState extends State<RecruiterJobUploadView>
    with TickerProviderStateMixin {
  late RecruiterJobUploadModel _model;

  @override
  void initState() {
    super.initState();
    _model = RecruiterJobUploadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                decoration: BoxDecoration(
                  color: Color(0xFF5C001F),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x20000000),
                      offset: Offset(
                        0.0,
                        1,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
                            width: 345,
                            height: 226,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                        child: Text(
                          'Concert Crew Aksara Resak',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                        child: Text(
                          'RM50 per hour',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 24,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 24,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 24,
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.white,
                            size: 24,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(170, 0, 0, 0),
                            child: Icon(
                              Icons.keyboard_double_arrow_right,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  // Add your ListView children here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
