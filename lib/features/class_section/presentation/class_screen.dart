// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, deprecated_member_use, no_leading_underscores_for_local_identifiers
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ClassSecreen extends StatefulWidget {
  dynamic className;
  ClassSecreen({
    super.key,
    this.className,
  });

  @override
  State<ClassSecreen> createState() => _ClassSecreenState();
}

class _ClassSecreenState extends State<ClassSecreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
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

  String _bnTitle(dynamic className) {
    final key = (className ?? '').toString().toLowerCase().trim();
    switch (key) {
      case 'ssc':
        return 'এসএসসি';
      case 'hsc':
        return 'এইচএসসি';
      case 'honors':
        return 'অনার্স';
      case 'college_admission':
        return 'কলেজ এডমিশন';
      default:
        return (className ?? '').toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    log("============> ${widget.className}");

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: '${_bnTitle(widget.className)} সাহায্য কেন্দ্র',
      ),

      // ✅ Body same thakbe
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                if (widget.className != 'college_admission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard(
                        color: AppColors.c15803D,
                        icon: AppIcons.sscIcon,
                        title: 'সাজেশন',
                        subtitle: 'সাজেশন বিষয়ক তথ্য',
                        type: 'suggestion',
                      ),
                      _buildCard(
                        color: AppColors.c1E40AF,
                        icon: AppIcons.trophyIcon,
                        title: 'রেজাল্ট',
                        subtitle: 'রেজাল্ট বিষয়ক সকল তথ্য',
                        type: 'result',
                      ),
                    ],
                  ),
                if (widget.className != 'college_admission')
                  SizedBox(height: 20),
                if (widget.className != 'college_admission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard(
                        color: AppColors.cDB2777,
                        icon: AppIcons.takaIcon,
                        title: 'উপবৃত্তি',
                        subtitle: 'সকল উপবৃত্তির তথ্য',
                        type: 'scholarship',
                      ),
                      _buildCard(
                        color: AppColors.cEA580C,
                        icon: AppIcons.noticeIcon,
                        title: 'নোটিশ',
                        subtitle: 'গুরুত্বপূর্ণ সকল নোটিশ',
                        type: 'notice',
                      ),
                    ],
                  ),
                if (widget.className == 'college_admission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard(
                        color: AppColors.c1E40AF,
                        icon: AppIcons.trophyIcon,
                        title: 'রেজাল্ট',
                        subtitle: 'রেজাল্ট বিষয়ক সকল তথ্য',
                        type: 'result',
                      ),
                      _buildCard(
                        color: AppColors.cEA580C,
                        icon: AppIcons.noticeIcon,
                        title: 'নোটিশ',
                        subtitle: 'গুরুত্বপূর্ণ সকল নোটিশ',
                        type: 'notice',
                      ),
                    ],
                  ),
                //UIHelper.verticalSpace(80.h),
              ],
            ),
          ),
        ),
      ),

      // ✅ Ad will stay always at the bottom
      bottomNavigationBar: _bannerAd == null
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
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

  Widget _buildCard({
    required Color color,
    required String icon,
    required String title,
    required String subtitle,
    required String type,
  }) {
    return GestureDetector(
      onTap: () {
        NavigationService.navigateToWithArgs(
          Routes.classTopicScreen,
          {
            'type': type,
            'className': widget.className,
          },
        );
      },
      child: Container(
        height: 110.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon, color: AppColors.white),
              SizedBox(height: 8),
              Text(
                title,
                style: TextFontStyle.hindisiliguri10w400.copyWith(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                style: TextFontStyle.hindisiliguri10w400.copyWith(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
