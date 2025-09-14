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
import 'package:always_update/features/course_section/presentation/honours_course/honours_group/data/honours_group_rx.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_group/model/honours_group_model.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/data/get_honours_single_rx.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/data/get_honours_subject_list_rx.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_model.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_subject_model.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/data/get_ssc_subject_video_rx.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/data/get_video_item_rx.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/model/ssc_video_item_model.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/model/ssc_video_subject_model.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_shortcut/data/get_video_shortcut_item_rx.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_shortcut/model/ssc_video_shortcut_model.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_suggestion/data/get_video_sugg_item_rx.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/ssc_video_suggestion/model/get_video_sugg_model.dart';
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

// * #################### SSC Video Suggestion ####################
GetVideoSuggRX sscVideoSuggRX = GetVideoSuggRX(
  empty: SscVideoSuggModel(),
  dataFetcher: BehaviorSubject<SscVideoSuggModel>(),
);

// * #################### SSC Video Short Cut ####################
GetVideoShortcutRX sscVideoShortcutRX = GetVideoShortcutRX(
  empty: SscVideoShortcutModel(),
  dataFetcher: BehaviorSubject<SscVideoShortcutModel>(),
);

// * #################### SSC Video Subject ####################
SscVideoSubjectRX sscVideoSubjectRX = SscVideoSubjectRX(
  empty: SscVideoSubjectModel(),
  dataFetcher: BehaviorSubject<SscVideoSubjectModel>(),
);

SscVideoItemRX sscVideoItemRX = SscVideoItemRX(
  empty: SscVideoItemSubjectModel(),
  dataFetcher: BehaviorSubject<SscVideoItemSubjectModel>(),
);

// * #################### Honours Group Suggestion ####################
GetHonoursGroupRX honoursGroupRX = GetHonoursGroupRX(
  empty: HonoursGroupModel(),
  dataFetcher: BehaviorSubject<HonoursGroupModel>(),
);

HonoursSubjectRX honoursSubjectRX = HonoursSubjectRX(
  empty: HonoursSubjectModel(),
  dataFetcher: BehaviorSubject<HonoursSubjectModel>(),
);

GetHonoursSingleItemRX honoursSingleItemRX = GetHonoursSingleItemRX(
  empty: HonoursMcqModel(),
  dataFetcher: BehaviorSubject<HonoursMcqModel>(),
);
