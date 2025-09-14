import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_subject_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class HonoursSubjectAPI {
  static final HonoursSubjectAPI _singleton = HonoursSubjectAPI._internal();

  HonoursSubjectAPI._internal();

  static HonoursSubjectAPI get instance => _singleton;

  Future<HonoursSubjectModel> honoursSubjectInfo() async {
    try {
      Response response = await getHttp(Endpoints.getHonoursPDFSubject());

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return HonoursSubjectModel.fromJson(data);
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
