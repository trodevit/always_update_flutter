// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ClassTopicDetails extends StatefulWidget {
  dynamic title, description, imagePath;

  ClassTopicDetails({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  State<ClassTopicDetails> createState() => _ClassTopicDetailsState();
}

class _ClassTopicDetailsState extends State<ClassTopicDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrls + widget.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: downloadProgress.progress,
                          color: AppColors.c000000,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, color: Colors.grey),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10.h),
                Text(
                  widget.title,
                  style: TextFontStyle.banglaSmallStyle9w400Kalpurush.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.c000000,
                  ),
                ),
                UIHelper.verticalSpace(10.h),
                Text(
                  widget.description,
                  style: TextFontStyle.banglaSmallStyle9w400Kalpurush.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
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
