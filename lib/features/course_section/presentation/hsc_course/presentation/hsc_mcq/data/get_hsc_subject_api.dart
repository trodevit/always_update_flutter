import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/model/hsc_mcq_subject_list_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class HscSubjectAPI {
  static final HscSubjectAPI _singleton = HscSubjectAPI._internal();

  HscSubjectAPI._internal();

  static HscSubjectAPI get instance => _singleton;

  Future<HscMcqSubListModel> hscSubjectInfo() async {
    try {
      Response response = await getHttp(Endpoints.getHscSubject());

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return HscMcqSubListModel.fromJson(data);
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
