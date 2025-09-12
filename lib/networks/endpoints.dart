// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const String url = "https://always-update.zobayerdev.top";
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
      "/api/class/$className/$topic";

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
  static String getSscPDFSubject() => "/api/subjects";
  static String getSscPDFSubjectSingleItem(
          dynamic type, className, subjectId) =>
      "/api/class/ssc/allpdf/$className/$type/$subjectId";
}
