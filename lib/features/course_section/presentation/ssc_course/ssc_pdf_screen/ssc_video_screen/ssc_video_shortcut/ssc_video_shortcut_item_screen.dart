// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_shortcut/model/ssc_video_shortcut_model.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter/material.dart';

class SscVideoShortcutItemScreen extends StatefulWidget {
  dynamic type, className;
  SscVideoShortcutItemScreen({
    super.key,
    this.type,
    this.className,
  });

  @override
  State<SscVideoShortcutItemScreen> createState() =>
      _SscVideoShortcutItemScreenState();
}

class _SscVideoShortcutItemScreenState
    extends State<SscVideoShortcutItemScreen> {
  @override
  void initState() {
    super.initState();
    sscVideoShortcutRX.videoShortcutRX(type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: "${widget.className}",
      ),
      body: StreamBuilder<SscVideoShortcutModel>(
          stream: sscVideoShortcutRX.getVideoShortcutRx,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('কোন রাউট পাওয়া যায়নি'));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No data available'));
            }
            final sscData = snapshot.data!.data;

            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: sscData!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: AppColors.boxShadow,
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r), // Top-left corner
                              topRight:
                                  Radius.circular(6.r), // Top-right corner
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imageUrls + sscData[index].thumbnail!,
                              width: double.infinity,
                              height: 200, // Adjust height as needed
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey[
                                    300], // Optional: grey background for error
                                child: Icon(Icons.error, color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    sscData[index].title!,
                                    style: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                            color: AppColors.c000000,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                UIHelper.verticalSpace(20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customButton(
                                      minWidth: 120.w,
                                      name: 'পিডিএফ দেখুন',
                                      textStyle: TextFontStyle
                                          .hindisiliguri10w400
                                          .copyWith(
                                        color: AppColors.cFFF5DA,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      onCallBack: () {
                                        log(sscData[index].pdf!);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PDFViewScreen(
                                                pdfURL: sscData[index].pdf!),
                                          ),
                                        );
                                      },
                                      context: context,
                                      color: AppColors.c02BF65,
                                      borderColor: AppColors.c02BF65,
                                    ),
                                    customButton(
                                      minWidth: 120.w,
                                      name: 'ভিডিও দেখুন',
                                      textStyle: TextFontStyle
                                          .hindisiliguri10w400
                                          .copyWith(
                                        color: AppColors.cFFF5DA,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      onCallBack: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(
                                                    id: sscData[index].url!),
                                          ),
                                        );
                                      },
                                      context: context,
                                      color: AppColors.cFF0000,
                                      borderColor: AppColors.cFF0000,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
