// ignore_for_file: unused_element, unused_import

import 'dart:io';
import 'package:always_update/features/class_section/presentation/class_screen.dart';
import 'package:always_update/features/class_section/presentation/class_topic_screen.dart';
import 'package:always_update/features/course_section/presentation/course_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/course_home_screen.dart';
import 'package:always_update/features/course_section/presentation/course_login_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_all_pdf/ssc_allpdf_category_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_all_pdf/ssc_allpdf_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_all_pdf/ssc_allpdf_single_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_all_pdf/ssc_allpdf_subjet_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_category_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_group_suggestion/ssc_group_subject_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_screen/ssc_shortcut_technique/ssc_shortcut_item_screen.dart';
import 'package:always_update/features/course_section/presentation/sub_screen/suggestion_formula_screen.dart';
import 'package:always_update/features/course_section/presentation/sub_screen/video_course_list_screen.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:flutter/cupertino.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  // * ################## Education Section ##################
  static const String classScreen = '/classScreen';
  static const String classTopicScreen = '/classTopicScreen';
  static const String pdfViewScreen = '/pdfViewScreen';
  static const String courseHomeScreen = '/courseHomeScreen';
  static const String courseLoginScreen = '/courseLoginScreen';
  static const String courseDashboardScreen = '/courseDashboardScreen';
  static const String videoCourseListScreen = '/videoCourseListScreen';
  static const String videoCourseScreen = '/videoCourseScreen';
  static const String suggestionFormulaScreen = '/suggestionFormulaScreen';

  // * ###################### SSC Course Section ######################
  static const String sscCategoryScreen = '/sscCategoryScreen';
  static const String sscGroupSubjectScreen = '/sscGroupSubjectScreen';
  static const String sscShortCutTechniqueScreen =
      '/sscShortCutTechniqueScreen';
  static const String sscPDFScreen = '/sscPDFScreen';
  static const String sscPDFCategoryScreen = '/sscPDFCategoryScreen';
  static const String sscAllPdfSubjectItemScreen =
      '/sscAllPdfSubjectItemScreen';

  static const String sscPDFSubjectItemScreen = '/sscPDFSubjectItemScreen';

  // * ###################### HSC Course Section ######################
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // * Class Screen
      case Routes.classScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ClassSecreen(
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => ClassSecreen(
                  className: argument['className'],
                ),
              );

      // * Class Topic Screen
      case Routes.classTopicScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ClassTopicScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ClassTopicScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
              );

      // * PDF View Screen
      case Routes.pdfViewScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: PDFViewScreen(
                  pdfURL: argument['pdfURL'],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => PDFViewScreen(
                  pdfURL: argument['pdfURL'],
                ),
              );

      case Routes.courseHomeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseHomeScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseHomeScreen(),
              );

      case Routes.courseLoginScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseLoginScreen(
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseLoginScreen(
                  className: argument['className'],
                ),
              );

      case Routes.courseDashboardScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseDashboardScreen(
                  className: argument['className'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseDashboardScreen(
                  className: argument['className'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
              );

      case Routes.videoCourseListScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: VideoCourseListScreen(
                  className: argument['className'],
                  type: argument['type'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => VideoCourseListScreen(
                  className: argument['className'],
                  type: argument['type'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
              );

      case Routes.videoCourseScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: VideoPlayerScreen(
                  id: argument['id'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => VideoPlayerScreen(
                  id: argument['id'],
                ),
              );

      case Routes.suggestionFormulaScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SuggestionFormulaScreen(
                  className: argument['className'],
                  type: argument['type'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SuggestionFormulaScreen(
                  className: argument['className'],
                  type: argument['type'],
                  email: argument['email'],
                  deviceID: argument['deviceID'],
                ),
              );

      // * ######################### SSC Course Section #########################
      case Routes.sscCategoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscCategoryScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscCategoryScreen(),
              );

      case Routes.sscGroupSubjectScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscGroupSubjectScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscGroupSubjectScreen(),
              );

      case Routes.sscShortCutTechniqueScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscShortcutItemScreen(
                  type: argument['type'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscShortcutItemScreen(
                  type: argument['type'],
                ),
              );

      case Routes.sscPDFScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscAllPdfScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscAllPdfScreen(),
              );

      case Routes.sscPDFCategoryScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscAllPdfCategoryScreen(
                  type: argument['type'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscAllPdfCategoryScreen(
                  type: argument['type'],
                ),
              );

      case Routes.sscAllPdfSubjectItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscAllPdfSubjectItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscAllPdfSubjectItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
              );

      case Routes.sscPDFSubjectItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscAllPdfSubjectSingleItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscAllPdfSubjectSingleItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
              );

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
