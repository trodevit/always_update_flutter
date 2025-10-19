import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/model/hsc_year_model.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:always_update/features/ad_helper.dart';
import 'dart:developer';

class HscDashboardScreen extends StatefulWidget {
  const HscDashboardScreen({super.key});

  @override
  State<HscDashboardScreen> createState() => _HscDashboardScreenState();
}

class _HscDashboardScreenState extends State<HscDashboardScreen> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    getHscYearRX.getHscYearRX();
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
      appBar: const CustomAppBar(title: 'এইচএসসি কোর্স'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<HscYearModel>(
            stream: getHscYearRX.getHscYearRx,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data?.data == null ||
                  snapshot.data!.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              }

              final hscYearData = snapshot.data!.data!;

              return Column(
                children: [
                  ListView.builder(
                    itemCount: hscYearData.length,
                    shrinkWrap: true, // ✅ গুরুত্বপূর্ণ
                    physics:
                        const NeverScrollableScrollPhysics(), // ✅ গুরুত্বপূর্ণ
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                              Routes.hscLoginScreen, {
                            'yearID': hscYearData[index].id,
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.boxShadow),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.hscLogo,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                                UIHelper.horizontalSpace(10.w),
                                Text(
                                  hscYearData[index].className ?? '',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c000000,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
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
