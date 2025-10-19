import 'dart:developer';

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SscShortcutScreen extends StatefulWidget {
  const SscShortcutScreen({super.key});

  @override
  State<SscShortcutScreen> createState() => _SscShortcutScreenState();
}

class _SscShortcutScreenState extends State<SscShortcutScreen> {
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
        title: 'এসএসসি শর্টকাট টেকনিক',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                      Routes.sscShortCutTechniqueScreen,
                      {
                        'type': "grammar",
                        'className': "গ্রামার অংশ",
                      },
                    );
                  },
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UIHelper.horizontalSpace(10.w),
                        SvgPicture.asset(
                          AppIcons.grammerNew,
                          width: 60.w,
                          height: 60.h,
                        ),
                        UIHelper.horizontalSpace(10.w),
                        Text(
                          'গ্রামার অংশ',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                      Routes.sscShortCutTechniqueScreen,
                      {
                        'type': "written",
                        'className': "লিখিত অংশ",
                      },
                    );
                  },
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UIHelper.horizontalSpace(10.w),
                        SvgPicture.asset(
                          AppIcons.writtenNew,
                          width: 60.w,
                          height: 60.h,
                        ),
                        UIHelper.horizontalSpace(10.w),
                        Text(
                          'লিখিত অংশ',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           // Get.to(() => SscShortcutItemScreen(type: 'grammar'));
                //           NavigationService.navigateToWithArgs(
                //               Routes.sscShortCutTechniqueScreen,
                //               {'type': "grammar"});
                //           ToastUtil.showShortToast(
                //               'Navigate to SSC Short Cut Technique - Grammar');
                //         },
                //         child: Container(
                //           height: 100,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey.shade800,
                //             ),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SvgPicture.asset(
                //                 AppIcons.courseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'গ্রামার পিডিএফ',
                //                 style:
                //                     TextFontStyle.hindisiliguri10w400.copyWith(
                //                   color: AppColors.c000000,
                //                   fontSize: 16,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () async {
                //           NavigationService.navigateToWithArgs(
                //               Routes.sscShortCutTechniqueScreen,
                //               {'type': "written"});
                //           ToastUtil.showShortToast(
                //               'Navigate to SSC Short Cut Technique - Written');
                //         },
                //         child: Container(
                //           height: 100,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey.shade800,
                //             ),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SvgPicture.asset(
                //                 AppIcons.courseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'রিটেন পিডিএফ',
                //                 style:
                //                     TextFontStyle.hindisiliguri10w400.copyWith(
                //                   color: AppColors.c000000,
                //                   fontSize: 16,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
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
