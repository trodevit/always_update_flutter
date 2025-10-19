import 'dart:developer';

import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    // _loadBannerAd();
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
        onAdOpened: (Ad ad) => log('Ad opened.'),
        onAdClosed: (Ad ad) => log('Ad closed.'),
        onAdImpression: (Ad ad) => log('Ad impression.'),
      ),
    ).load();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'রেজাল্ট দেখুন'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // * SSC Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.eboardresults.com/v2/home");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.sscLogo,
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(
                            'এসএসসি রেজাল্ট দেখুন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * HSC Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.eboardresults.com/v2/home");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.hscLogo,
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(
                            'এইচএসসি রেজাল্ট দেখুন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * Board challenge
                GestureDetector(
                  onTap: () {
                    _launchUrl(
                        "https://efile.dhakaeducationboard.gov.bd/index.php/result/rsc/hsc/2025");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.boardChallenge,
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(
                            'বোর্ড চ্যালেঞ্জ রেজাল্ট দেখুন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * College Admission Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("http://xiclassadmission.gov.bd/");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.collegeAdmissionIcon,
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(
                            'কলেজ ভর্তি রেজাল্ট দেখুন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * Honours Admission Result
                GestureDetector(
                  onTap: () {
                    _launchUrl(
                        "http://app55.nu.edu.bd/nu-web/admissionTestResultQueryForm");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.honoursLogo,
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(
                            'অনার্স এডমিশন রেজাল্ট দেখুন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(100.h),

                if (_bannerAd != null)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
                UIHelper.verticalSpace(5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
