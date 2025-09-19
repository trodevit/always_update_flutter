// ignore_for_file: must_be_immutable
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/model/ssc_video_subject_model.dart';
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
    final groupFilter = (widget.type ?? '').toString().trim().toLowerCase();

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title:
            'ভিডিও ক্লাস${groupFilter.isNotEmpty ? " (${widget.classType})" : ""}',
      ),
      body: SafeArea(
        child: StreamBuilder<SscVideoSubjectModel>(
          stream: sscVideoSubjectRX.getSscVideoSubjectRx,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            final allSubjects = snapshot.data!.data ?? [];

            // ✅ Filter by group (widget.classType -> item.group)
            final filteredSubjects = allSubjects.where((s) {
              if (groupFilter.isEmpty) return true; // no filter -> show all
              final grp = (s.group ?? '').toString().trim().toLowerCase();
              return grp == groupFilter;
            }).toList();

            if (filteredSubjects.isEmpty) {
              return Center(
                child: Text(
                  'এই "$groupFilter" গ্রুপের জন্য কোনো ডেটা পাওয়া যায়নি',
                  textAlign: TextAlign.center,
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: filteredSubjects.length,
                itemBuilder: (context, index) {
                  final item = filteredSubjects[index];
                  return GestureDetector(
                    onTap: () {
                      NavigationService.navigateToWithArgs(
                        Routes.sscVideoSubjectItemScreen,
                        {
                          'type': widget.type,
                          'classType': widget.classType,
                          'itemID': item.id,
                          'subjectTitle': item.subject,
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
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
                                child: Image.asset(
                                  AppImages.groupArtsImage,
                                  height: 32.h,
                                  width: 32.w,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.subject ?? 'Subject Name',
                                    style: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  // Optional: group/class hint
                                  // if ((item.group ?? '').isNotEmpty)
                                  //   Text(
                                  //     'Group: ${item.group}',
                                  //     style: TextFontStyle.hindisiliguri10w400
                                  //         .copyWith(fontSize: 12.sp),
                                  //   ),
                                ],
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
          },
        ),
      ),
    );
  }
}
