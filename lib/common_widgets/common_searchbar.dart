import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    super.key,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged, // 🟢 Added for live filtering
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintText: hintText,
        hintStyle: TextFontStyle.banglaSmallStyle9w400Kalpurush.copyWith(
          color: AppColors.c5A5C5F,
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppIcons.searchIcon,
            height: 14,
            width: 14,
            fit: BoxFit.cover,
          ),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
