import 'dart:developer';
import 'package:always_update/ad_helper.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/privacy_policy_screen.dart';
import 'package:always_update/features/terms_condition_screen.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  String _deviceId = 'Unknown';
  String _deviceName = 'Unknown';

  final List<String> _images = [
    AppImages.oneImage,
    AppImages.twoImage,
    AppImages.threeImage,
    AppImages.fourImage,
    AppImages.fiveImage,
  ];

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
    getClassApiRXObj.classNameRX();
    _sendDeviceInfo();

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          log('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    ).load();
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        if (await Permission.phone.request().isGranted) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          setState(() {
            _deviceId = androidInfo.id;
            _deviceName = androidInfo.model;
          });
        } else {
          setState(() {
            _deviceId = 'Permission Denied';
            _deviceName = 'Permission Denied';
          });
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        setState(() {
          _deviceId = iosInfo.identifierForVendor ?? 'Unknown';
          _deviceName = iosInfo.name;
        });
      }
      // * After getting the device info, call the function to send it
      _sendDeviceInfo();
    } catch (e) {
      setState(() {
        _deviceId = 'Error: $e';
        _deviceName = 'Error: $e';
      });
    }
  }

  Future<void> _sendDeviceInfo() async {
    try {
      await deviceIdloginRX.signIn(
        deviceId: _deviceId,
        deviceName: _deviceName,
      );
      log('Device info sent successfully');
    } catch (e) {
      log('Error sending device info: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: _currentIndex == index ? 12 : 8,
      height: _currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  // Function to get icon based on category name (title)
// Function to get icon based on category name (title)
  SvgPicture getIconForCategory(String title) {
    switch (title.toLowerCase()) {
      // Convert the title to lowercase for case-insensitive matching
      case 'ssc':
        return SvgPicture.asset(AppIcons.sscIcon); // SSC icon
      case 'hsc':
        return SvgPicture.asset(AppIcons.hscIcon); // HSC icon
      case 'honours':
        return SvgPicture.asset(AppIcons.honoursIcon); // Honours icon
      case 'college admission':
        return SvgPicture.asset(
            AppIcons.hscIcon); // College Admission icon (same as HSC)
      default:
        return SvgPicture.asset(
            AppIcons.sscIcon); // Default icon if title doesn't match
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'অধ্যয়ন সহায়িকা',
        leadingIconUnVisible: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_bannerAd != null)
                  Container(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),

                // === IMAGE SLIDER ===
                SizedBox(
                  height: 215.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            _images[index],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 12),

                // === DOT INDICATOR ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                    (index) => _buildIndicator(index),
                  ),
                ),
                SizedBox(height: 20),

                // * === শিক্ষা বিভাগ ===
                Text(
                  'আমাদের সেবাসমূহ',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),

                // * === GridView with Category Boxes ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateToWithArgs(
                          Routes.classScreen,
                          {
                            'className': 'ssc',
                          },
                        );
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.sscImage,
                              height: 45.h,
                              width: 45.w,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'এসএসসি',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateToWithArgs(
                          Routes.classScreen,
                          {
                            'className': 'hsc',
                          },
                        );
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.hscImage,
                              height: 45.h,
                              width: 45.w,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'এইচএসসি',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateToWithArgs(
                          Routes.classScreen,
                          {
                            'className': 'collegeadmission',
                          },
                        );
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.collegeAdmissionIcon,
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'কলেজ ভর্তি',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateToWithArgs(
                          Routes.classScreen,
                          {
                            'className': 'honours',
                          },
                        );
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.honoursLogo,
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'অনার্স',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.resultScreen);
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.resultIcon,
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'রেজাল্ট দেখুন',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(
                          Routes.courseHomeScreen,
                        );
                      },
                      child: Container(
                        height: 90.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.activeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.myCourse,
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'আমার কোর্স',
                              textAlign: TextAlign.center,
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // * === DEVICE INFO SECTION ===
                SizedBox(height: 20),
                Text(
                  'ডিভাইস তথ্য',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ডিভাইস: $_deviceName',
                        style: TextFontStyle.hindisiliguri10w400.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'আইডি: $_deviceId',
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // long হলে কেটে দেবে
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.copy,
                                size: 20, color: Colors.grey[700]),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: _deviceId));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Device ID কপি হয়েছে'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Text(
                  'আমাদের সম্পর্কে',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(10.h),
                GestureDetector(
                  onTap: () {
                    // NavigationService.navigateTo(Routes.aboutUsScreen);
                    Get.to(() => PrivacyPolicyScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.activeColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'প্রাইভেসি পলিসি',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10.h),
                GestureDetector(
                  onTap: () {
                    // NavigationService.navigateTo(Routes.aboutUsScreen);
                    Get.to(() => TermsAndConditionsScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.activeColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'টার্মস অ্যান্ড কন্ডিশন',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(20.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'This app is developed by Trodev IT',
                    style: TextFontStyle.headLine22w400Poppins.copyWith(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
