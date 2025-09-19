// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_model.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HonoursSingleItemScreen extends StatefulWidget {
  dynamic type, classType, itemID, subjectTitle;
  HonoursSingleItemScreen({
    super.key,
    this.type,
    this.classType,
    this.itemID,
    this.subjectTitle,
  });

  @override
  State<HonoursSingleItemScreen> createState() =>
      _HonoursSingleItemScreenState();
}

class _HonoursSingleItemScreenState extends State<HonoursSingleItemScreen> {
  @override
  void initState() {
    super.initState();
    honoursSingleItemRX.getHonoursItemRX(
      type: widget.type,
      classType: widget.classType,
      subjectId: widget.itemID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: widget.subjectTitle,
      ),
      body: StreamBuilder<HonoursMcqModel>(
          stream: honoursSingleItemRX.getHonoursItemRx,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('কোন রাউট পাওয়া যায়নি'));
            }
            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.data == null ||
                snapshot.data!.data!.isEmpty) {
              return Center(
                child: Text(
                  'কোন ডাটা পাওয়া যায়নি',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: AppColors.c000000,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            final allPDFData = snapshot.data!.data;

            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: allPDFData!.length,
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
                              imageUrl:
                                  imageUrls + allPDFData[index].thumbnail!,
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
                                    allPDFData[index].title!,
                                    style: TextFontStyle.hindisiliguri10w400
                                        .copyWith(
                                      color: AppColors.c000000,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(20.h),
                                customButton(
                                  minWidth: double.infinity,
                                  name: 'পিডিএফ দেখুন',
                                  textStyle: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: AppColors.cFFF5DA,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onCallBack: () {
                                    log(allPDFData[index].pdf!);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PDFViewScreen(
                                            pdfURL: allPDFData[index].pdf!),
                                      ),
                                    );
                                  },
                                  context: context,
                                  color: AppColors.c02BF65,
                                  borderColor: AppColors.c02BF65,
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
