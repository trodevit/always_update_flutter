// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_group/model/honours_group_model.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:always_update/features/ad_helper.dart';

class HonoursGroupItemScreen extends StatefulWidget {
  dynamic type, className;
  HonoursGroupItemScreen({
    super.key,
    this.type,
    this.className,
  });

  @override
  State<HonoursGroupItemScreen> createState() => _HonoursGroupItemScreenState();
}

class _HonoursGroupItemScreenState extends State<HonoursGroupItemScreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    honoursGroupRX.honoursGroupRX(type: widget.type);
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
        title: "${widget.className}",
      ),
      body: StreamBuilder<HonoursGroupModel>(
        stream: honoursGroupRX.getHonoursGroupRx,
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
                            topRight: Radius.circular(6.r), // Top-right corner
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
                                    textStyle: TextFontStyle.hindisiliguri10w400
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
                                    textStyle: TextFontStyle.hindisiliguri10w400
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
        },
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
