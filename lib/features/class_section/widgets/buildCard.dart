// // ignore_for_file: file_names

// import 'package:always_update/assets_helper/app_colors.dart';
// import 'package:always_update/assets_helper/app_fonts.dart';
// import 'package:always_update/helpers/all_routes.dart';
// import 'package:always_update/helpers/navigation_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class Buildcard extends StatelessWidget {

//   final Color color;
//   final String icon;
//   final String title;
//   final String subtitle;
//   final String type;
//   const Buildcard({
//     super.key,
//     required this.color,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.type,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         NavigationService.navigateToWithArgs(
//           Routes.classTopicScreen,
//           {
//             'type': type,
//             'className': 'widget.className',
//           },
//         );
//       },
//       child: Container(
//         height: 110.h,
//         width: 150.w,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset(icon, color: AppColors.white),
//               SizedBox(height: 8),
//               Text(
//                 title,
//                 style: TextFontStyle.hindisiliguri10w400.copyWith(
//                   color: Colors.white,
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               Text(
//                 subtitle,
//                 style: TextFontStyle.hindisiliguri10w400.copyWith(
//                   color: Colors.white,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

