// import 'dart:developer';
// import 'package:always_update/assets_helper/app_colors.dart';
// import 'package:always_update/assets_helper/app_fonts.dart';
// import 'package:always_update/assets_helper/app_icons.dart';
// import 'package:always_update/common_widgets/custom_appbar.dart';
// import 'package:always_update/helpers/all_routes.dart';
// import 'package:always_update/helpers/navigation_service.dart';
// import 'package:always_update/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class CourseHomeScreen extends StatefulWidget {
//   const CourseHomeScreen({super.key});

//   @override
//   State<CourseHomeScreen> createState() => _CourseHomeScreenState();
// }

// class _CourseHomeScreenState extends State<CourseHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.cFFFFFF,
//       appBar: CustomAppBar(
//         title: 'আমার কোর্স',
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(
//               16,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.boxShadow,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                       color: AppColors.boxShadow,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           'আপনি যদি আমাদের এই প্রিমিয়াম কোর্সগুলোর মধ্যে থেকে কিছু শিখতে চান, তাহলে আমাদের কোর্সে এনরোল করুন, কোর্স কিনতে আমাদের সাথে যোগাযোগ করুন whatsapp নাম্বারে।',
//                           style: TextFontStyle.hindisiliguri10w400.copyWith(
//                             color: AppColors.cFFFFFF,
//                             fontSize: 14.sp,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         UIHelper.verticalSpace(10.h),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'কোর্স নিতে যা যা প্রয়োজন\n'
//                             '- ডিভাইস আইডি দিন (হোম স্ক্রিন থেকে কপি করুন)\n'
//                             '- নাম, মোবাইল নাম্বার, ইমেইল\n'
//                             '- এই নাম্বারে যোগাযোগ করুনঃ+ 8801755555555',
//                             style: TextFontStyle.hindisiliguri10w400.copyWith(
//                               color: AppColors.cFFFFFF,
//                               fontSize: 13.sp,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Get.to(() =>
//                           //     SscCategoryScreen()); // Pass the widget directly
//                           NavigationService.navigateTo(
//                             Routes.sscTypeCategoryScreen,
//                           );
//                         },
//                         child: Container(
//                           height: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: Colors.grey.shade800,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                 AppIcons.courseIcon,
//                                 width: 40,
//                                 height: 40,
//                               ),
//                               Text(
//                                 'এসএসসি কোর্স',
//                                 style:
//                                     TextFontStyle.hindisiliguri10w400.copyWith(
//                                   color: AppColors.c000000,
//                                   fontSize: 16,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           NavigationService.navigateTo(
//                             Routes.hscDashboardScreen,
//                           );
//                           log('Navigating to HSC Dashboard Screen');
//                         },
//                         child: Container(
//                           height: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: Colors.grey.shade800,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                 AppIcons.courseIcon,
//                                 width: 40,
//                                 height: 40,
//                               ),
//                               Text(
//                                 'এইচএসসি কোর্স',
//                                 style:
//                                     TextFontStyle.hindisiliguri10w400.copyWith(
//                                   color: AppColors.c000000,
//                                   fontSize: 16,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           NavigationService.navigateTo(
//                             Routes.honoursDashboardScreen,
//                           );
//                           log('Navigating to Honours Dashboard Screen');
//                         },
//                         child: Container(
//                           height: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: Colors.grey.shade800,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                 AppIcons.courseIcon,
//                                 width: 40,
//                                 height: 40,
//                               ),
//                               Text(
//                                 'অনার্স কোর্স',
//                                 style:
//                                     TextFontStyle.hindisiliguri10w400.copyWith(
//                                   color: AppColors.c000000,
//                                   fontSize: 16,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseHomeScreen extends StatefulWidget {
  const CourseHomeScreen({super.key});

  @override
  State<CourseHomeScreen> createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  final String _phoneNumber = "+8801743182139";

  Future<void> _openWhatsApp() async {
    final Uri native = Uri.parse("whatsapp://send?phone=$_phoneNumber");
    final Uri web = Uri.parse("https://wa.me/$_phoneNumber");
    final Uri playStore =
        Uri.parse("https://play.google.com/store/apps/details?id=com.whatsapp");

    try {
      if (await canLaunchUrl(native)) {
        await launchUrl(native);
      } else if (await canLaunchUrl(web)) {
        await launchUrl(web, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(playStore, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("WhatsApp চালু করা যায়নি")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: const CustomAppBar(title: 'আমার কোর্স'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Info Box
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.boxShadow,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.boxShadow),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'আপনি যদি আমাদের এই প্রিমিয়াম কোর্সগুলোর মধ্যে থেকে কিছু শিখতে চান, '
                        'তাহলে আমাদের কোর্সে এনরোল করুন, কোর্স কিনতে আমাদের সাথে যোগাযোগ করুন WhatsApp নাম্বারে।',
                        style: TextFontStyle.hindisiliguri10w400.copyWith(
                          color: AppColors.cFFFFFF,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      UIHelper.verticalSpace(10.h),

                      // Requirements + Phone + WhatsApp icon (clickable)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.cFFFFFF,
                              fontSize: 13.sp,
                            ),
                            children: [
                              const TextSpan(
                                text: 'কোর্স নিতে যা যা প্রয়োজন\n'
                                    '- ডিভাইস আইডি দিন (হোম স্ক্রিন থেকে কপি করুন)\n'
                                    '- নাম, মোবাইল নাম্বার, ইমেইল\n'
                                    '- এই নাম্বারে যোগাযোগ করুনঃ ',
                              ),
                              TextSpan(
                                text: "8801743182139",
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _openWhatsApp,
                              ),
                              const WidgetSpan(child: SizedBox(width: 6)),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: _openWhatsApp,
                                  child: Icon(
                                    Icons.message,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 3 Course Cards row
              Row(
                children: [
                  Expanded(
                    child: _CourseCard(
                      title: 'এসএসসি কোর্স',
                      iconAsset: AppIcons.sscIcon,
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.sscTypeCategoryScreen,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _CourseCard(
                      title: 'এইচএসসি কোর্স',
                      iconAsset: AppIcons.honoursIcon,
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.hscDashboardScreen,
                        );
                        log('Navigating to HSC Dashboard Screen');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _CourseCard(
                      title: 'অনার্স কোর্স',
                      iconAsset: AppIcons.hscIcon,
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.honoursLoginScreen,
                        );
                        log('Navigating to Honours Login Screen');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable course card
class _CourseCard extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback onTap;

  const _CourseCard({
    required this.title,
    required this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconAsset, width: 40, height: 40),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextFontStyle.hindisiliguri10w400.copyWith(
                color: AppColors.c000000,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
