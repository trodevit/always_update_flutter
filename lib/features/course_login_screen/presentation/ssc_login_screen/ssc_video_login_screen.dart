// ignore_for_file: must_be_immutable, unused_field
import 'dart:developer';
import 'dart:io';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/assets_helper/app_lottie.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/common_widgets/custom_textField.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class SscVideoLoginScreen extends StatefulWidget {
  const SscVideoLoginScreen({
    super.key,
  });

  @override
  State<SscVideoLoginScreen> createState() => _SscVideoLoginScreenState();
}

class _SscVideoLoginScreenState extends State<SscVideoLoginScreen> {
  String _deviceId = 'Unknown';
  String _deviceName = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
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
    } catch (e) {
      setState(() {
        _deviceId = 'Error: $e';
        _deviceName = 'Error: $e';
      });
    }
  }

  bool _isObscure = true;
  bool isLoading = false; // Track the loading state
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log('=============> Device ID: $_deviceId');
    log('=============> Device Name: $_deviceName');

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.gradiant_two,
              AppColors.gradiant_one,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SizedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.asset(
                        AppImages.playstoreLogo,
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Always Update',
                      style: TextFontStyle.textStyle17w600Poppins.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'আমাদের এসএসসি ভিডিও কোর্স দেখতে হলে আপনাকে লগইন করতে হবে।',
                      style: TextFontStyle.hindisiliguri10w400.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cE8EBED,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back',
                                style: TextFontStyle.textStyle18w600Poppins
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          CustomTextFormField(
                            isPrefixIcon: true,
                            isBorder: true,
                            fillColor: AppColors.cFBFBFB,
                            hintText: 'ইমেইল',
                            iconpath: AppIcons.emailIcon,
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            obscureText: _isObscure,
                            isPrefixIcon: true,
                            isBorder: true,
                            fillColor: AppColors.cFBFBFB,
                            suffixIcon: _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onSuffixIconTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            hintText: 'পাসওয়ার্ড',
                            iconpath: AppIcons.lockIcon,
                            controller: _passwordController,
                          ),
                          SizedBox(height: 20),
                          isLoading // If the loading state is true, show loading
                              ? Container(
                                  height: 62,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Lottie.asset(
                                    AppLottie.loading,
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              : customButton(
                                  name: 'Sign In',
                                  onCallBack: () async {
                                    print('Sign In button clicked');
                                    setState(() {
                                      isLoading = true;
                                    });

                                    bool success = await courseLoginRX.signIn(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      device_id: _deviceId,
                                    );

                                    print('Login success: $success');
                                    setState(() {
                                      isLoading = false;
                                    });

                                    if (success) {
                                      if (courseLoginRX
                                              .dataFetcher.value.user?.ssc ==
                                          1) {
                                        NavigationService.navigateTo(
                                          Routes.sscVideoCategoryScreen,
                                        );

                                        Get.snackbar(
                                          "Success",
                                          "Login successful ✔",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: AppColors.c02BF65,
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 5),
                                        );
                                      } else {
                                        Get.snackbar(
                                          "Failed",
                                          "You don't have SSC access ❌",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              AppColors.ratingColor,
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 5),
                                        );
                                      }
                                    } else {
                                      Get.snackbar(
                                        "Failed",
                                        "Login unsuccessful ❌",
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 5),
                                      );
                                    }
                                  },
                                  context: context,
                                  color: AppColors.primaryColor,
                                  borderColor: AppColors.primaryColor,
                                ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
