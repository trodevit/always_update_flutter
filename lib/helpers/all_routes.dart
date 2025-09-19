// ignore_for_file: unused_element, unused_import

import 'dart:io';
import 'package:always_update/features/class_section/presentation/class_screen.dart';
import 'package:always_update/features/class_section/presentation/class_topic_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/ssc_login_screen/ssc_pdf_login_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/ssc_login_screen/ssc_video_login_screen.dart';
import 'package:always_update/features/course_section/presentation/course_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/course_home_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/course_honours_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/course_hsc_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/course_login_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_group/honours_group_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_group/honours_group_item_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/honours_mcq_subjectlist_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/honours_msc_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/honourse_mcq_item_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_course_features_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/hsc_group_sugg_item_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/hsc_group_sugg_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/hsc_mcq_dashboard.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/hsc_mcq_single_item.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/hsc_subject_list_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/hsc_shortcut_dashboard_screen.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/hsc_shortcut_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_all_pdf/ssc_allpdf_category_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_all_pdf/ssc_allpdf_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_all_pdf/ssc_allpdf_single_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_all_pdf/ssc_allpdf_subjet_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_category_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_group_suggestion/ssc_group_subject_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_shortcut_technique/ssc_shortcut_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_type_course_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_all_video/ssc_all_video_subject_list_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_all_video/ssc_all_video_subject_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_all_video/ssc_video_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_category_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_shortcut/ssc_video_shortcut_item_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_shortcut/ssc_video_shortcut_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_suggestion/ssc_video_ittem_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_suggestion/ssc_video_suggestion_screen.dart';
import 'package:always_update/features/course_section/presentation/sub_screen/suggestion_formula_screen.dart';
import 'package:always_update/features/course_section/presentation/sub_screen/video_course_list_screen.dart';
import 'package:always_update/features/course_section/presentation/video_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/honours_login_screen/honours_group_login_screen.dart';
import 'package:always_update/features/course_login_screen/presentation/honours_login_screen/honours_mcq_login_screen.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:always_update/features/result_section/result_screen.dart';
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

  // * ##########################################################
  static const String courseDashboardScreen = '/courseDashboardScreen';
  static const String videoCourseListScreen = '/videoCourseListScreen';
  static const String videoCourseScreen = '/videoCourseScreen';
  static const String suggestionFormulaScreen = '/suggestionFormulaScreen';

  // * ###################### SSC Course Section ######################
  static const String sscTypeCategoryScreen = '/sscTypeCategoryScreen';
  static const String sscVideoCategoryScreen = '/sscVideoCategoryScreen';
  static const String sscCategoryScreen = '/sscCategoryScreen';
  static const String sscGroupSubjectScreen = '/sscGroupSubjectScreen';
  static const String sscShortCutTechniqueScreen =
      '/sscShortCutTechniqueScreen';
  static const String sscPDFScreen = '/sscPDFScreen';
  static const String sscPDFCategoryScreen = '/sscPDFCategoryScreen';
  static const String sscAllPdfSubjectItemScreen =
      '/sscAllPdfSubjectItemScreen';

  static const String sscPDFSubjectItemScreen = '/sscPDFSubjectItemScreen';

  // * ###################### SSC Video Course Section ######################
  static const String sscVideoDashboardScreen = '/sscVideoDashboardScreen';
  static const String sscGroupSuggestionScreen = '/sscGroupSuggestionScreen';
  static const String sscVideoItemScreen = '/sscVideoItemScreen';
  static const String sscVideoShortcutScreen = '/sscVideoShortcutScreen';
  static const String sscVideoShortcutItemScreen =
      '/sscVideoShortcutItemScreen';

  static const String sscVideoSubjectScreen = '/sscVideoSubjectScreen';
  static const String sscVideoSubjectListScreen = '/sscVideoSubjectListScreen';
  static const String sscVideoSubjectItemScreen = '/sscVideoSubjectItemScreen';

  // * ################################ Honours Course Section ###############################
  static const String honoursDashboardScreen = '/honoursDashboardScreen';
  static const String honoursGroupDashboardScreen =
      '/honoursGroupDashboardScreen';
  static const String honoursGroupItemScreen = '/honoursGroupItemScreen';
  static const String honoursMCQDashboardScreen = '/honoursMCQDashboardScreen';
  static const String honoursSubjectListScreen = '/honoursSubjectListScreen';
  static const String honoursMCQItemScreen = '/honoursMCQItemScreen';

  // * ################################# HSC Course Section #################################
  static const String hscDashboardScreen = '/hscDashboardScreen';
  static const String hscCourseFeaturesScreen = '/hscCourseFeaturesScreen';
  static const String hscGroupSuggScreen = '/hscGroupSuggScreen';
  static const String hscGroupSuggItemScreen = '/hscGroupSuggItemScreen';
  static const String hscSubjectListScreen = '/hscSubjectListScreen';
  static const String hscMcqDashboardScreen = '/hscMcqDashboardScreen';
  static const String hscMCQItemScreen = '/hscMCQItemScreen';
  // * ######################################################################################
  // * HSC Shortcut Item Screen
  static const String hscShortcutDashboardScreen =
      '/hscShortcutDashboardScreen';
  static const String hscShortcutItemScreen = '/hscShortcutItemScreen';

  // * ######################### Result Section #########################
  static const String resultScreen = '/resultScreen';

  // * ################## Login Screen Section ##################
  static const String courseLoginScreen = '/courseLoginScreen';
  static const String hscLoginScreen = '/hscLoginScreen';
  static const String honoursLoginScreen = '/honoursLoginScreen';
  static const String honoursMCQLoginScreen = '/honoursMCQLoginScreen';
  static const String honoursGroupLoginScreen = '/honoursGroupLoginScreen';

  // * ############################# SSC Course Login Section #############################
  static const String sscPdfLoginScreen = '/sscPdfLoginScreen';
  static const String sscVideoLoginScreen = '/sscVideoLoginScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // * ################## SSC Course Login Section ##################
      // * SSC PDF Login Screen
      case Routes.sscPdfLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscPDFLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscPDFLoginScreen(),
              );

      case Routes.sscVideoLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscVideoLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscVideoLoginScreen(),
              );
      // * Result Screen
      case Routes.resultScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ResultScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => ResultScreen(),
              );

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

// * ######################### SSC Login Section #########################
      case Routes.courseLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseLoginScreen(),
              );

      // * ######################### HSC Login Section #########################
      case Routes.hscLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseHSCLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseHSCLoginScreen(),
              );

      // * #########################################################################
      // * ######################### Honours Login Section #########################
      // * #########################################################################

      case Routes.honoursLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CourseHonoursLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => CourseHonoursLoginScreen(),
              );

      case Routes.honoursMCQLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HonoursMCQLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HonoursMCQLoginScreen(),
              );

      case Routes.honoursGroupLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HonoursGroupLoginScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HonoursGroupLoginScreen(),
              );

      // * ###########################################################################
      // * ###########################################################################

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
      // * ######################################################################
      case Routes.sscTypeCategoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscTypeCourseScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscTypeCourseScreen(),
              );

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

      // * ######################################################################
      // * ######################### SSC Video Section #########################
      case Routes.sscVideoCategoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscVideoCategoryScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscVideoCategoryScreen(),
              );

      case Routes.sscGroupSuggestionScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscGroupSuggestionScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscGroupSuggestionScreen(),
              );

      case Routes.sscVideoItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscVideoItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscVideoItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
              );

      case Routes.sscVideoShortcutScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscVideoShortcutScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscVideoShortcutScreen(),
              );

      case Routes.sscVideoShortcutItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscVideoShortcutItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscVideoShortcutItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
              );

      case Routes.sscVideoSubjectScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SscVideoSubjectScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const SscVideoSubjectScreen(),
              );

      case Routes.sscVideoSubjectListScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscVideoSubjectListScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscVideoSubjectListScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
              );

      case Routes.sscVideoSubjectItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SscVideoItemSubjectScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => SscVideoItemSubjectScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
              );

      // * #################################### Honours Course Section ####################################
      // * ################################################################################################
      case Routes.honoursDashboardScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const HonoursDashboardScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const HonoursDashboardScreen(),
              );

      case Routes.honoursGroupDashboardScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const HonoursGroupDashboardScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const HonoursGroupDashboardScreen(),
              );

      case Routes.honoursGroupItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HonoursGroupItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HonoursGroupItemScreen(
                  type: argument['type'],
                  className: argument['className'],
                ),
              );

      case Routes.honoursMCQDashboardScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const HonoursMCQDashboardScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const HonoursMCQDashboardScreen(),
              );

      case Routes.honoursSubjectListScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HonoursSubjectListScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HonoursSubjectListScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                ),
              );

      case Routes.honoursMCQItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HonoursSingleItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HonoursSingleItemScreen(
                  type: argument['type'],
                  classType: argument['classType'],
                  subjectTitle: argument['subjectTitle'],
                  itemID: argument['itemID'],
                ),
              );
      // * ######################################################################################
      // * ################################# HSC Course Section #################################
      // * ######################################################################################
      case Routes.hscDashboardScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const HscDashboardScreen(),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => const HscDashboardScreen(),
              );

      case Routes.hscCourseFeaturesScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscCourseFeaturesScreen(
                  yearID: argument['yearID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscCourseFeaturesScreen(
                  yearID: argument['yearID'],
                ),
              );

      case Routes.hscGroupSuggScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscGroupSuggScreen(
                  yearID: argument['yearID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscGroupSuggScreen(
                  yearID: argument['yearID'],
                ),
              );

      case Routes.hscGroupSuggItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscGroupSuggItemScreen(
                  yearID: argument['yearID'],
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscGroupSuggItemScreen(
                  yearID: argument['yearID'],
                  className: argument['className'],
                ),
              );

      case Routes.hscMcqDashboardScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscMcqDashboardScreen(
                  yearID: argument['yearID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscMcqDashboardScreen(
                  yearID: argument['yearID'],
                ),
              );

      case Routes.hscSubjectListScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscSubjectListScreen(
                  yearID: argument['yearID'],
                  classType: argument['classType'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscSubjectListScreen(
                  yearID: argument['yearID'],
                  classType: argument['classType'],
                ),
              );

      case Routes.hscMCQItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscMcqSingleItemScreen(
                  type: argument['yearID'],
                  classType: argument['classType'],
                  itemID: argument['itemID'],
                  subjectTitle: argument['subjectTitle'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscMcqSingleItemScreen(
                  type: argument['yearID'],
                  classType: argument['classType'],
                  itemID: argument['itemID'],
                  subjectTitle: argument['subjectTitle'],
                ),
              );

      // * ############################## HSC Shortcut Section ##############################
      case Routes.hscShortcutDashboardScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscShortcutDashboardScreen(
                  yearID: argument['yearID'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscShortcutDashboardScreen(
                  yearID: argument['yearID'],
                ),
              );

      // * ############################## HSC Shortcut Section ##############################
      case Routes.hscShortcutItemScreen:
        final argument = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HscShortcutItemScreen(
                  yearID: argument['yearID'],
                  type: argument['type'],
                  className: argument['className'],
                ),
                settings: settings,
              )
            : CupertinoPageRoute(
                builder: (context) => HscShortcutItemScreen(
                  yearID: argument['yearID'],
                  type: argument['type'],
                  className: argument['className'],
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
