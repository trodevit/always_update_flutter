import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/toast.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
    'https://picsum.photos/id/1018/600/300',
    'https://picsum.photos/id/1015/600/300',
    'https://picsum.photos/id/1020/600/300',
    'https://picsum.photos/id/1024/600/300',
    'https://picsum.photos/id/1035/600/300',
  ];

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
    getClassApiRXObj.classNameRX();
    _sendDeviceInfo();
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
      ToastUtil.showShortToast('Device info sent successfully');
    } catch (e) {
      ToastUtil.showShortToast('Error sending device info: $e');
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
        title: 'অধ্যয়ন সহায়িকা',
        leadingIconUnVisible: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === IMAGE SLIDER ===
                SizedBox(
                  height: 200,
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
                          child: Image.network(
                            _images[index],
                            fit: BoxFit.cover,
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
                  'শিক্ষা বিভাগ',
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
                            SvgPicture.asset(
                              AppIcons.sscIcon,
                              height: 40,
                              width: 40,
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
                            SvgPicture.asset(
                              AppIcons.hscIcon,
                              height: 40,
                              width: 40,
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
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 5),
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
                              AppIcons.honoursIcon,
                              height: 40,
                              width: 40,
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
                    UIHelper.horizontalSpace(10.w),
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
                            SizedBox(height: 5),
                            Text(
                              'রেজাল্ট',
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

                // * === COURSE SECTION ===
                SizedBox(height: 20),
                Text(
                  'কোর্স বিভাগ',
                  style: TextFontStyle.hindisiliguri10w400.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(10),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(Routes.courseHomeScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.c02BF65,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: SvgPicture.asset(AppIcons.courseIcon),
                            ),
                            Text(
                              'আমাদের কোর্স সমূহ',
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SvgPicture.asset(AppIcons.arrowNext),
                        ),
                      ],
                    ),
                  ),
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
                        'ডিভাইস আইডি: $_deviceId',
                        style: TextFontStyle.hindisiliguri10w400.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'ডিভাইস নাম: $_deviceName',
                        style: TextFontStyle.hindisiliguri10w400.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
