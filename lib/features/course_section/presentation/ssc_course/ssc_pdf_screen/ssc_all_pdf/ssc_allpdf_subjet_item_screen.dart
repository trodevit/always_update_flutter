// ignore_for_file: must_be_immutable
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_subject_model.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:always_update/features/ad_helper.dart';
import 'dart:developer';

class SscAllPdfSubjectItemScreen extends StatefulWidget {
  dynamic type, classType;
  SscAllPdfSubjectItemScreen({super.key, this.type, this.classType});

  @override
  State<SscAllPdfSubjectItemScreen> createState() =>
      _SscAllPdfSubjectItemScreenState();
}

class _SscAllPdfSubjectItemScreenState
    extends State<SscAllPdfSubjectItemScreen> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    sscPDFSubjectRX.sscPDFSubjectRX();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          log('Ad loaded.');
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'পিডিএফ নোটস',
      ),
      body: SafeArea(
        child: StreamBuilder<SscPdfSubjectModel>(
          stream: sscPDFSubjectRX.getSscPDFSubjectRx,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            final subjects = snapshot.data?.data ?? [];

            // ✅ Filter by group using classType
            final filter =
                (widget.classType ?? '').toString().trim().toLowerCase();

            final filteredSubjects = subjects.where((s) {
              final grp = (s.group ?? '').toLowerCase().trim();
              return grp == filter;
            }).toList();

            if (filteredSubjects.isEmpty) {
              return Center(
                child:
                    Text('এই "$filter" গ্রুপের জন্য কোনো ডেটা পাওয়া যায়নি'),
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
                        Routes.sscPDFSubjectItemScreen,
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
                                  AppImages.sscImage,
                                  height: 32.h,
                                  width: 32.w,
                                ),
                              ),
                              Text(
                                item.subject ?? 'Subject Name',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: SvgPicture.asset(
                              AppIcons.arrowNext,
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
      ),
      bottomNavigationBar: _bannerAd == null
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Container(
                color: Colors.white,
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
    );
  }
}
