// ignore_for_file: unnecessary_string_interpolations, unused_local_variable, avoid_print, depend_on_referenced_packages

import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/constants/app_constants.dart';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/features/privacy_policy_screen.dart';
import 'package:always_update/features/terms_condition_screen.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/di.dart';
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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  String _deviceId = 'Unknown';

  final List<String> _images = [
    AppImages.oneImage,
    AppImages.twoImage,
    AppImages.threeImage,
    AppImages.fourImage,
    AppImages.fiveImage,
  ];

  @override
  void initState() {
    super.initState();
    _initializeDeviceInfo();
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
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    ).load();
  }

  // 🔹 Generate UUID once per install (no Firebase)
  Future<void> _initializeDeviceInfo() async {
    try {
      final storage = const FlutterSecureStorage();
      const key = 'unique_device_id';
      String? existingId = await storage.read(key: key);

      String deviceId;
      if (existingId == null) {
        deviceId = const Uuid().v4();
        await storage.write(key: key, value: deviceId);
        log('✅ New UUID created: $deviceId');
      } else {
        deviceId = existingId;
        log('✅ Existing UUID found: $deviceId');
      }

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      String deviceName = "Unknown";

      if (Platform.isAndroid) {
        if (await Permission.phone.request().isGranted) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          deviceName = androidInfo.model;
        } else {
          deviceName = "Permission Denied";
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.name;
      }

      setState(() {
        _deviceId = deviceId;
        appData.write(kKeyUUID, _deviceId);
      });

      await _sendDeviceInfo();
    } catch (e) {
      log('❌ Error getting device info: $e');
      setState(() {
        _deviceId = 'Error: $e';
      });
    }
  }

  Future<void> _sendDeviceInfo() async {
    try {
      await deviceIdloginRX.signIn(
        deviceId: _deviceId,
        fcmToken: appData.read(kKeyFCMToken),
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

  SvgPicture getIconForCategory(String title) {
    switch (title.toLowerCase()) {
      case 'ssc':
        return SvgPicture.asset(AppIcons.sscIcon);
      case 'hsc':
        return SvgPicture.asset(AppIcons.hscIcon);
      case 'honours':
        return SvgPicture.asset(AppIcons.honoursIcon);
      case 'college admission':
        return SvgPicture.asset(AppIcons.hscIcon);
      default:
        return SvgPicture.asset(AppIcons.sscIcon);
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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
                UIHelper.verticalSpace(5.h),

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

                // === Services Section ===
                Text(
                  'আমাদের সেবাসমূহ',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),

                // === Education Grid ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceBox(
                      title: 'এসএসসি',
                      image: AppImages.sscImage,
                      route: Routes.classScreen,
                      args: {'className': 'ssc'},
                    ),
                    _buildServiceBox(
                      title: 'এইচএসসি',
                      image: AppImages.hscImage,
                      route: Routes.classScreen,
                      args: {'className': 'hsc'},
                    ),
                    _buildServiceBox(
                      title: 'কলেজ ভর্তি',
                      svgIcon: AppIcons.collegeAdmissionIcon,
                      route: Routes.classScreen,
                      args: {'className': 'college_admission'},
                    ),
                  ],
                ),
                UIHelper.verticalSpace(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceBox(
                      title: 'অনার্স',
                      svgIcon: AppIcons.honoursLogo,
                      route: Routes.classScreen,
                      args: {'className': 'honors'},
                    ),
                    _buildServiceBox(
                      title: 'রেজাল্ট দেখুন',
                      svgIcon: AppIcons.resultIcon,
                      route: Routes.resultScreen,
                    ),
                    _buildServiceBox(
                      title: 'আমার কোর্স',
                      svgIcon: AppIcons.myCourse,
                      route: Routes.courseHomeScreen,
                    ),
                  ],
                ),

                // === DEVICE INFO ===
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
                        'ক্লায়েন্ট আইডিঃ-',
                        style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$_deviceId',
                        style: TextFontStyle.headLine22w400Poppins.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      customButton(
                        name: 'কপি করুন',
                        color: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        textStyle: TextFontStyle.banglaSmallStyle9w400Kalpurush
                            .copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        onCallBack: () {
                          Clipboard.setData(ClipboardData(text: _deviceId));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'ক্লায়েন্ট আইডি কপি হয়েছে',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        context: context,
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),

                // === About Section ===
                Text(
                  'আমাদের সম্পর্কে',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(10.h),
                _buildAboutBox(
                  title: 'প্রাইভেসি পলিসি',
                  onTap: () => Get.to(() => PrivacyPolicyScreen()),
                ),
                UIHelper.verticalSpace(10.h),
                _buildAboutBox(
                  title: 'টার্মস অ্যান্ড কন্ডিশন',
                  onTap: () => Get.to(() => TermsAndConditionsScreen()),
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

  // 🔹 Reusable service box widget
  Widget _buildServiceBox({
    required String title,
    String? image,
    String? svgIcon,
    required String route,
    Map<String, dynamic>? args,
  }) {
    return GestureDetector(
      onTap: () {
        if (args != null) {
          NavigationService.navigateToWithArgs(route, args);
        } else {
          NavigationService.navigateTo(route);
        }
      },
      child: Container(
        height: 90.h,
        width: 110.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.activeColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(image, height: 45.h, width: 45.w)
            else if (svgIcon != null)
              SvgPicture.asset(svgIcon, height: 40.h, width: 40.w),
            SizedBox(height: 8.h),
            Text(
              title,
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
    );
  }

  // 🔹 About box
  Widget _buildAboutBox({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.activeColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextFontStyle.hindisiliguri10w400.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 18.sp, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
