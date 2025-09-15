// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/model/hsc_group_sugg_model.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter/material.dart';

class HscGroupSuggItemScreen extends StatefulWidget {
  dynamic yearID, className;
  HscGroupSuggItemScreen({
    super.key,
    this.yearID,
    this.className,
  });

  @override
  State<HscGroupSuggItemScreen> createState() => _HscGroupSuggItemScreenState();
}

class _HscGroupSuggItemScreenState extends State<HscGroupSuggItemScreen> {
  @override
  void initState() {
    super.initState();
    getHscGroupSuggRX.getHscGroupSuggRX(
      className: widget.className,
      yearID: widget.yearID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: "গ্রুপ ভিত্তিক সাজেশন",
      ),
      body: StreamBuilder<HscGroupSuggModel>(
        stream: getHscGroupSuggRX.getHscGroupSuggRx,
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'কোন ডাটা পাওয়া যাচ্ছে নাহ',
                style: TextFontStyle.hindisiliguri10w400.copyWith(
                  color: AppColors.c000000,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // Data presence check
          final sscData = snapshot.data?.data ?? [];
          if (sscData.isEmpty) {
            return Center(
              child: Text(
                'কোন ডাটা পাওয়া যাচ্ছে নাহ',
                style: TextFontStyle.hindisiliguri10w400.copyWith(
                  color: AppColors.c000000,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // Data list
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: sscData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            topLeft: Radius.circular(6.r),
                            topRight: Radius.circular(6.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                imageUrls + (sscData[index].thumbnail ?? ''),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey[300],
                              child:
                                  const Icon(Icons.error, color: Colors.grey),
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
                                  sscData[index].title ?? '',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: AppColors.c000000,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                    textStyle: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                      color: AppColors.cFFF5DA,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onCallBack: () {
                                      final pdfUrl = sscData[index].pdf ?? '';
                                      log(pdfUrl);
                                      if (pdfUrl.isNotEmpty) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewScreen(pdfURL: pdfUrl),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'পিডিএফ লিংক পাওয়া যায়নি')),
                                        );
                                      }
                                    },
                                    context: context,
                                    color: AppColors.c02BF65,
                                    borderColor: AppColors.c02BF65,
                                  ),
                                  customButton(
                                    minWidth: 120.w,
                                    name: 'ভিডিও দেখুন',
                                    textStyle: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                      color: AppColors.cFFF5DA,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onCallBack: () {
                                      final videoId = sscData[index].url ?? '';
                                      if (videoId.isNotEmpty) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(id: videoId),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'ভিডিও লিংক পাওয়া যায়নি')),
                                        );
                                      }
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
        },
      ),
    );
  }
}
