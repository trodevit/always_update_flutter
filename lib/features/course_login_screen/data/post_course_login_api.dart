// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/model/course_login_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../networks/dio/dio.dart';

final class PostCourseLoginAPI {
  static final PostCourseLoginAPI _singleton = PostCourseLoginAPI._internal();

  PostCourseLoginAPI._internal();

  static PostCourseLoginAPI get instance => _singleton;

  Future<CourseLoginModel> courseSigninApi({
    required dynamic email,
    required dynamic device_id,
    required dynamic password,
  }) async {
    try {
      // Create the request data map
      Map data = {
        "email": email,
        "device_id": device_id,
        "password": password,
      };
      // Make the POST request
      Response response = (await postHttp(Endpoints.courseLogin(), data));

      if (response.statusCode == 200) {
        CourseLoginModel data = CourseLoginModel.fromJson(
          json.decode(
            json.encode(
              response.data,
            ),
          ),
        );
        // ToastUtil.showShortToast('User Login Successfully');
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      log("Error during signup: $error");
      rethrow;
    }
  }
}
