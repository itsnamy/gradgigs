import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:gradgigs/model/req_job_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecruiterJobUploadView extends StatefulWidget {
  final RecruiterJobUploadModel recruiter = RecruiterJobUploadModel();
  RecruiterJobUploadView({super.key});

  @override
  State<RecruiterJobUploadView> createState() =>
      _RecruiterJobUploadViewWidgetState();
}

class _RecruiterJobUploadViewWidgetState extends State<RecruiterJobUploadView>
    with TickerProviderStateMixin {
  late RecruiterJobUploadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = RecruiterJobUploadModel();

    //  Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             RecruiterJobUploadView(recruiter: widget.recruiter)));

//controller for tab bar
    // _model.tabBarController = TabController(
    //   vsync: this,
    //   length: 3,
    //   initialIndex: 0,
    // )..addListener(() => setState(() {}));
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment(0, 0),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(color: Colors.white),
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: Color(0xFF5C001F),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Academic',
                      ),
                      Tab(
                        text: 'Non-Academic',
                      ),
                    ],
                    // controller: _model.tabBarController,
                    // onTap: (i) async {
                    //   [() async {}, () async {}, () async {}][i]();
                    // },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            //start one card
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 8, 16, 0),
                              child: Container(
                                width: double.infinity,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 12, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
                                                  width: 345,
                                                  height: 226,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 10, 16, 0),
                                                child: Text(
                                                  'Concert Crew Aksara Resak',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 5, 16, 5),
                                              child: Text(
                                                'RM50 per hour',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(170, 0, 0, 0),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //end one card

                            //start card two

                            //end card two
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            //start card for academic jobs
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 8, 16, 0),
                              child: Container(
                                width: double.infinity,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 12, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
                                                  width: 345,
                                                  height: 226,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 10, 16, 0),
                                                child: Text(
                                                  'Faculty of Computing Research Assistant',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 5, 16, 5),
                                              child: Text(
                                                'RM70 per hour',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(170, 0, 0, 0),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //end card for academic jobs

      //start card for non-academic jobs

      //end card for non-academic jobs
    );
  }
}
