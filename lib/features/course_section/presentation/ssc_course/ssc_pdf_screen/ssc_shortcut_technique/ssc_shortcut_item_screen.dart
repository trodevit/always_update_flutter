// // ignore_for_file: must_be_immutable

// import 'dart:developer';
// import 'package:always_update/assets_helper/app_colors.dart';
// import 'package:always_update/assets_helper/app_fonts.dart';
// import 'package:always_update/common_widgets/custom_appbar.dart';
// import 'package:always_update/common_widgets/custom_button.dart';
// import 'package:always_update/features/course_section/data/data/ssc_data/ssc_model.dart';
// import 'package:always_update/features/course_section/presentation/video_screen.dart';
// import 'package:always_update/features/pdf_view_screen.dart';
// import 'package:always_update/helpers/ui_helpers.dart';
// import 'package:always_update/networks/api_acess.dart';
// import 'package:always_update/networks/endpoints.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SscShortcutItemScreen extends StatefulWidget {
//   dynamic type;
//   SscShortcutItemScreen({super.key, this.type});

//   @override
//   State<SscShortcutItemScreen> createState() => _SscShortcutItemScreenState();
// }

// class _SscShortcutItemScreenState extends State<SscShortcutItemScreen> {
//   @override
//   void initState() {
//     super.initState();
//     sscShortCutTechniquesRX.getShortcutRX(type: widget.type);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.cFFFFFF,
//       appBar: CustomAppBar(
//         title: 'শর্টকাট টেকনিক',
//       ),
//       body: StreamBuilder<SscGroupSubjectModel>(
//         initialData: SscGroupSubjectModel(data: []),
//         stream: sscShortCutTechniquesRX.getShortcutRx,
//         builder: (context, snapshot) {
//           print('ConnectionState: ${snapshot.connectionState}');
//           print('HasData: ${snapshot.hasData}');
//           print('HasError: ${snapshot.hasError}');
//           if (snapshot.hasError) {
//             print('Error: ${snapshot.error}');
//             return Center(
//               child: Text(
//                 'কোন রাউট পাওয়া যায়নি: ${snapshot.error}',
//                 style: TextFontStyle.hindisiliguri10w400.copyWith(
//                   color: AppColors.c000000,
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             print('Showing loading...');
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData ||
//               snapshot.data == null ||
//               snapshot.data!.data == null ||
//               snapshot.data!.data!.isEmpty) {
//             print('No data available');
//             return Center(
//               child: Text(
//                 'কোন তথ্য পাওয়া যায়নি',
//                 style: TextFontStyle.hindisiliguri10w400.copyWith(
//                   color: AppColors.c000000,
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             );
//           }

//           final sscData = snapshot.data!.data!; // Null safety

//           return Padding(
//             padding: EdgeInsets.all(16),
//             child: ListView.builder(
//               itemCount: sscData.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.0),
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.cFFFFFF,
//                       borderRadius: BorderRadius.circular(6.r),
//                       border: Border.all(
//                         color: AppColors.boxShadow,
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(6.r),
//                             topRight: Radius.circular(6.r),
//                           ),
//                           child: Image.network(
//                             imageUrls + sscData[index].thumbnail!,
//                             width: double.infinity,
//                             height: 200,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   sscData[index].title!,
//                                   style: TextFontStyle.hindisiliguri10w400
//                                       .copyWith(
//                                           color: AppColors.c000000,
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               UIHelper.verticalSpace(20.h),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   customButton(
//                                     minWidth: 120.w,
//                                     name: 'পিডিএফ দেখুন',
//                                     textStyle: TextFontStyle.hindisiliguri10w400
//                                         .copyWith(
//                                       color: AppColors.cFFF5DA,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     onCallBack: () {
//                                       log(sscData[index].pdf!);
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => PDFViewScreen(
//                                               pdfURL: sscData[index].pdf!),
//                                         ),
//                                       );
//                                     },
//                                     context: context,
//                                     color: AppColors.c02BF65,
//                                     borderColor: AppColors.c02BF65,
//                                   ),
//                                   customButton(
//                                     minWidth: 120.w,
//                                     name: 'ভিডিও দেখুন',
//                                     textStyle: TextFontStyle.hindisiliguri10w400
//                                         .copyWith(
//                                       color: AppColors.cFFF5DA,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     onCallBack: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               VideoPlayerScreen(
//                                                   id: sscData[index].url!),
//                                         ),
//                                       );
//                                     },
//                                     context: context,
//                                     color: AppColors.cFF0000,
//                                     borderColor: AppColors.cFF0000,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// ignore_for_file: must_be_immutable, unused_element, deprecated_member_use, unused_element_parameter

import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_model.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SscShortcutItemScreen extends StatefulWidget {
  dynamic type, className;
  SscShortcutItemScreen({super.key, this.type, this.className});

  @override
  State<SscShortcutItemScreen> createState() => _SscShortcutItemScreenState();
}

class _SscShortcutItemScreenState extends State<SscShortcutItemScreen> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    // স্ক্রিন আসামাত্রই API/Stream ট্রিগার
    sscShortCutTechniquesRX.getShortcutRX(type: widget.type);
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
        title: widget.className ?? 'শর্টকাট টেকনিক',
      ),
      body: StreamBuilder<SscGroupSubjectModel>(
        // initialData না দিলে প্রথম ফ্রেমেই লোডিং দেখাবে
        stream: sscShortCutTechniquesRX.getShortcutRx,
        builder: (context, snapshot) {
          log('ConnectionState: ${snapshot.connectionState}');
          log('HasData: ${snapshot.hasData}');
          log('HasError: ${snapshot.hasError}');

          // 1) এরর হ্যান্ডলিং
          if (snapshot.hasError) {
            log('Error: ${snapshot.error}');
            return _CenteredMessage(
              'কোন রাউট পাওয়া যায়নি: ${snapshot.error}',
            );
          }

          // 2) যতক্ষণ না ডেটা আসে ততক্ষণ লোডার (waiting/active but no data)
          final isLoading =
              snapshot.connectionState == ConnectionState.waiting ||
                  (snapshot.connectionState == ConnectionState.active &&
                      !snapshot.hasData);

          if (isLoading) {
            return const _FullscreenLoader();
          }

          // 3) ডেটা না থাকলে খালি মেসেজ
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.data == null ||
              snapshot.data!.data!.isEmpty) {
            log('No data available');
            return const _CenteredMessage('কোন তথ্য পাওয়া যায়নি');
          }

          // 4) ডেটা থাকলে UI রেন্ডার
          final sscData = snapshot.data!.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: sscData.length,
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
                        // Thumbnail
                        if ((item.thumbnail ?? '').isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r),
                              topRight: Radius.circular(6.r),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imageUrls + item.thumbnail!,
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
                                color: Colors.grey[300],
                                child: Icon(Icons.error, color: Colors.grey),
                              ),
                            ),
                          ),
                        // Content
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.title ?? '',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: AppColors.c000000,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(20.h),

                              // Actions
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
                                      final pdf = item.pdf ?? '';
                                      log('PDF: $pdf');
                                      if (pdf.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'পিডিএফ লিঙ্ক পাওয়া যায়নি'),
                                          ),
                                        );
                                        return;
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              PDFViewScreen(pdfURL: pdf),
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
                                      if (url.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('ভিডিও লিঙ্ক পাওয়া যায়নি'),
                                          ),
                                        );
                                        return;
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
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

/// ফুলস্ক্রিন সেন্টার্ড লোডার (প্রথম ফ্রেমেই দেখা যাবে)
class _FullscreenLoader extends StatelessWidget {
  const _FullscreenLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// সেন্টার্ড টেক্সট মেসেজ উইজেট (খালি/এরর কেসে)
class _CenteredMessage extends StatelessWidget {
  final String message;
  const _CenteredMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextFontStyle.hindisiliguri10w400.copyWith(
          color: AppColors.c000000,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// ইমেজ লোডিং/এরর হলে শ্যালো স্কেলেটন প্লেসহোল্ডার
class _SkeletonBox extends StatelessWidget {
  final String? label;
  const _SkeletonBox({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.boxShadow.withOpacity(.2),
      alignment: Alignment.center,
      child: label == null
          ? const SizedBox.shrink()
          : Text(
              label!,
              style: TextFontStyle.hindisiliguri10w400.copyWith(
                color: AppColors.c000000,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
