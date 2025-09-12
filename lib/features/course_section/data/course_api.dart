import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/model/course_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetCourseAPI {
  static final GetCourseAPI _singleton = GetCourseAPI._internal();
  GetCourseAPI._internal();

  static GetCourseAPI get instance => _singleton;

  Future<CourseModel> courseInfo({
    required dynamic className,
    required dynamic topic,
    required dynamic email,
    required dynamic deviceID,
  }) async {
    try {
      Response response = await getHttp(Endpoints.getCourse(
        className,
        topic,
        email,
        deviceID,
      ));

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return CourseModel.fromJson(data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      log('== Dio Error ==');
      print(error);
      throw ErrorHandler.handle(error).failure;
    }
  }
}
