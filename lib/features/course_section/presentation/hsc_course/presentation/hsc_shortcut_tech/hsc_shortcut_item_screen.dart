// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/model/get_hsc_shortcut_model.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter/material.dart';

class HscShortcutItemScreen extends StatefulWidget {
  dynamic yearID, type, className;
  HscShortcutItemScreen({
    super.key,
    this.yearID,
    this.type,
    this.className,
  });

  @override
  State<HscShortcutItemScreen> createState() => _HscShortcutItemScreenState();
}

class _HscShortcutItemScreenState extends State<HscShortcutItemScreen> {
  @override
  void initState() {
    super.initState();
    hscShortcutRXObj.hscShortcutRX(type: widget.type, yearID: widget.yearID);
  }

  @override
  Widget build(BuildContext context) {
    log("====> ${widget.type}");
    log("====> ${widget.yearID}");
    log("====> ${widget.className}");

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: "${widget.className}",
      ),
      body: StreamBuilder<HscShortcutModel>(
        stream: hscShortcutRXObj.getHscShortcutRx,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('কোন রাউট পাওয়া যায়নি'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data available'));
          }

          // 👉 লিস্টটা নিন, null-safe করুন
          final sscData = snapshot.data!.data ?? [];

          // 👉 লিস্ট ফাঁকা হলে সরাসরি "কোন ডাটা পাওয়া যায়নি"
          if (sscData.isEmpty) {
            return Center(
                child: Text(
              'কোন ডাটা পাওয়া যায়নি',
              style: TextFontStyle.hindisiliguri10w400.copyWith(
                color: AppColors.c000000,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount:
                  sscData.length, // ✅ safe, কারণ ফাঁকা কেস আলাদা করা হয়েছে
              itemBuilder: (context, index) {
                final item = sscData[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: AppColors.boxShadow),
                    ),
                    child: Column(
                      children: [
                        // thumbnail null হলে errorWidget/placeholder দেখাবে
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.r),
                            topRight: Radius.circular(6.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageUrls + (item.thumbnail ?? ''),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                        value: progress.progress)),
                            errorWidget: (context, url, error) => Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.error),
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
                                  item.title ?? 'Untitled',
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
                                      final pdfUrl = item.pdf ?? '';
                                      if (pdfUrl.isEmpty) return;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PDFViewScreen(pdfURL: pdfUrl),
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
                                    textStyle: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                      color: AppColors.cFFF5DA,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onCallBack: () {
                                      final url = item.url ?? '';
                                      if (url.isEmpty) return;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerScreen(id: url),
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
        },
      ),
    );
  }
}
