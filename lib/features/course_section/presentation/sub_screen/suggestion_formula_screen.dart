// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/features/course_section/model/course_model.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionFormulaScreen extends StatefulWidget {
  dynamic className, type, email, deviceID;
  SuggestionFormulaScreen({
    super.key,
    required this.className,
    required this.type,
    required this.email,
    required this.deviceID,
  });

  @override
  State<SuggestionFormulaScreen> createState() =>
      _SuggestionFormulaScreenState();
}

class _SuggestionFormulaScreenState extends State<SuggestionFormulaScreen> {
  @override
  void initState() {
    super.initState();
    getCourseAPIRX.courseRX(
      className: widget.className,
      topic: widget.type,
      email: widget.email,
      deviceID: widget.deviceID,
    );
  }

  @override
  Widget build(BuildContext context) {
    log('Class Name: ${widget.className}');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                StreamBuilder<CourseModel>(
                    stream: getCourseAPIRX.getCourseRx,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return Center(child: Text('No data available'));
                      }

                      final courseData = snapshot.data!.data;
                      return ListView.builder(
                          itemCount: courseData!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.courseIcon,
                                              width: 40,
                                              height: 40,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    courseData[index].title ??
                                                        'No Title',
                                                    style: TextFontStyle
                                                        .hindisiliguri10w400
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    'No Description',
                                                    style: TextFontStyle
                                                        .hindisiliguri10w400
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                    maxLines: 5,
                                                    softWrap: true,
                                                    overflow: TextOverflow
                                                        .ellipsis, // তিনটি ডট (...) দেখাবে
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SvgPicture.asset(
                                        AppIcons.arrowNext,
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                // Add your content here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
