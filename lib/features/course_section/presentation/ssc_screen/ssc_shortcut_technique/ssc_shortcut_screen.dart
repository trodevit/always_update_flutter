import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SscShortcutScreen extends StatefulWidget {
  const SscShortcutScreen({super.key});

  @override
  State<SscShortcutScreen> createState() => _SscShortcutScreenState();
}

class _SscShortcutScreenState extends State<SscShortcutScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(() => SscShortcutItemScreen(type: 'grammar'));
                          NavigationService.navigateToWithArgs(
                              Routes.sscShortCutTechniqueScreen,
                              {'type': "grammar"});
                          ToastUtil.showShortToast(
                              'Navigate to SSC Short Cut Technique - Grammar');
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppIcons.courseIcon,
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                'গ্রামার পিডিএফ',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: AppColors.c000000,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          NavigationService.navigateToWithArgs(
                              Routes.sscShortCutTechniqueScreen,
                              {'type': "written"});
                          ToastUtil.showShortToast(
                              'Navigate to SSC Short Cut Technique - Written');
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppIcons.courseIcon,
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                'রিটেন পিডিএফ',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: AppColors.c000000,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
