// ignore_for_file: must_be_immutable
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/model/ssc_video_subject_model.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SscVideoSubjectListScreen extends StatefulWidget {
  dynamic type, classType;
  SscVideoSubjectListScreen({super.key, this.type, this.classType});

  @override
  State<SscVideoSubjectListScreen> createState() =>
      _SscVideoSubjectListScreenState();
}

class _SscVideoSubjectListScreenState extends State<SscVideoSubjectListScreen> {
  @override
  void initState() {
    super.initState();
    sscVideoSubjectRX.sscVideoSubjectRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'ভিডিও ক্লাস',
      ),
      body: SafeArea(
        child: StreamBuilder<SscVideoSubjectModel>(
            stream: sscVideoSubjectRX.getSscVideoSubjectRx,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
                return Center(
                  child: Text('No data available'),
                );
              }
              final subjects = snapshot.data!.data;

              return Padding(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: subjects?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        NavigationService.navigateToWithArgs(
                            Routes.sscVideoSubjectItemScreen, {
                          'type': widget.type,
                          'classType': widget.classType,
                          'itemID': subjects?[index].id,
                          'subjectTitle': subjects?[index].subject,
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.c02BF65,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    AppIcons.courseIcon,
                                    height: 32.h,
                                    width: 32.w,
                                  ),
                                ),
                                Text(
                                  subjects?[index].subject ?? 'Subject Name',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: SvgPicture.asset(AppIcons.arrowNext),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
