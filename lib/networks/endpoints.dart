// ignore_for_file: constant_identifier_names, non_constant_identifier_names
const String url = "https://admin.alwaysupdate.online";
const String imageUrls = "$url/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) => "";
}

final class Endpoints {
  Endpoints._();

  // * backend_url
  static String getClass() => "/api/class_list";
  static String deviceIdLogin() => "/api/device-id";
  static String courseLogin() => "/api/login";

  // * subject by data
  static String getSubject(dynamic className, topic) =>
      "/api/$className/$topic";

  // * video course list
  static String getCourse(dynamic className, topic, email, device_id) =>
      "/api/class-wise-course/$email/$device_id/$className/$topic";

  // * ssc group suggestion
  static String getSscGroupSuggestion(dynamic type) =>
      "/api/class/ssc/pdf/$type";

  // * shortcut technique
  static String getShortcutTechnique(dynamic type) =>
      "/api/class/ssc/shortcut/$type";

  // * ssc pdf subject
  static String getSscPDFSubject() => "/api/ssc/subjects";
  static String getSscPDFSubjectSingleItem(
          dynamic type, className, subjectId) =>
      "/api/class/ssc/allpdf/$className/$type/$subjectId";

  // * ######################### SSC Video Course Section #########################
  // * ssc group suggestion
  static String getSscVideoGroupSuggestion(dynamic type) =>
      "/api/class/ssc/video/$type";

  static String getVideoShortcut(dynamic type) =>
      "/api/class/ssc/shortcut/video/$type";

  static String getVideoSubjectItem(dynamic type, dynamic id) =>
      "/api/class/ssc/video/$type/$id";

  static String getSscVideoSubject() => "/api/ssc/subjects";

  // * ######################### Honours Video Course Section #########################
  static String getHonoursGroup(dynamic type) =>
      "/api/class/honors/group-pdf/$type";

  static String getHonoursPDFSubject() => "/api/honors/subjects";

  static String getHonoursPDFSubjectSingleItem(
          dynamic type, className, subjectId) =>
      "/api/class/honors/$type/question/$className/$subjectId";

  // * ############################ HSC Video Course Section #########################
  static String getHscYear() => "/api/hsc/class";
  static String getHscGroupSugg(dynamic className, dynamic yearID) =>
      "/api/hsc/pdf/$className/$yearID";
  static String getHscSubject() => "/api/hsc/subjects";
  static String getHscPDFSubjectSingleItem(
          dynamic type, className, courseType, subjectId) =>
      "/api/hsc/allpdf/$className/$courseType/$subjectId/$type";

  static String getHscShortcutItem(dynamic type, yearID) =>
      "/api/hsc/shortcut/$type/$yearID";
}
