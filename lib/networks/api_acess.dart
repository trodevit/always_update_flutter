import 'package:always_update/features/class_section/data/subject_model_rx.dart';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/features/course_section/data/course_rx.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_allpdf/get_pdf_subject_item_rx.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_allpdf/ssc_subject_rx.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_group/ssc_group_suggestion_rx.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_model.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_single_item_model.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_subject_model.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_shortcut/ssc_shortcut_rx.dart';
import 'package:always_update/features/course_section/data/post_course_login_rx.dart';
import 'package:always_update/features/course_section/model/course_login_model.dart';
import 'package:always_update/features/course_section/model/course_model.dart';
import 'package:always_update/features/home_screen/data/class_name_rx.dart';
import 'package:always_update/features/home_screen/data/post_device_info_rx.dart';
import 'package:always_update/features/home_screen/model/class_name_model.dart';
import 'package:always_update/features/home_screen/model/device_id_model.dart';
import 'package:rxdart/subjects.dart';

GetClassAPIRX getClassApiRXObj = GetClassAPIRX(
  empty: ClassNameModel(),
  dataFetcher: BehaviorSubject<ClassNameModel>(),
);

GetSubjectAPIRX getSubjectAPIRX = GetSubjectAPIRX(
  empty: SubjectModel(),
  dataFetcher: BehaviorSubject<SubjectModel>(),
);

GetCourseAPIRX getCourseAPIRX = GetCourseAPIRX(
  empty: CourseModel(),
  dataFetcher: BehaviorSubject<CourseModel>(),
);

PostLoginRX deviceIdloginRX = PostLoginRX(
  empty: DeviceIdModel(),
  dataFetcher: BehaviorSubject<DeviceIdModel>(),
);

PostCourseLoginRX courseLoginRX = PostCourseLoginRX(
  empty: CourseLoginModel(),
  dataFetcher: BehaviorSubject<CourseLoginModel>(),
);

// * #################### SSC Group Suggestion ####################
GetSscGroupSuggestionRX sscGroupSuggestionRX = GetSscGroupSuggestionRX(
  empty: SscGroupSubjectModel(),
  dataFetcher: BehaviorSubject<SscGroupSubjectModel>(),
);

// * #################### SSC Short Cut Techniques ####################
GetSscShortcutRX sscShortCutTechniquesRX = GetSscShortcutRX(
  empty: SscGroupSubjectModel(),
  dataFetcher: BehaviorSubject<SscGroupSubjectModel>(),
);

SscPDFSubjectRX sscPDFSubjectRX = SscPDFSubjectRX(
  empty: SscPdfSubjectModel(),
  dataFetcher: BehaviorSubject<SscPdfSubjectModel>(),
);

GetPDFSubjectSingleItemRX sscPDFSubjectSingleItemRX = GetPDFSubjectSingleItemRX(
  empty: SscPdfSubjectSingleItemModel(),
  dataFetcher: BehaviorSubject<SscPdfSubjectSingleItemModel>(),
);
