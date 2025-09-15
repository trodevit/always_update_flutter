import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/model/hsc_group_sugg_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetHscGroupSuggAPI {
  static final GetHscGroupSuggAPI _singleton = GetHscGroupSuggAPI._internal();

  GetHscGroupSuggAPI._internal();

  static GetHscGroupSuggAPI get instance => _singleton;

  Future<HscGroupSuggModel> getHscGroupSuggInfo({
    dynamic className,
    dynamic yearID,
  }) async {
    try {
      Response response = await getHttp(
        Endpoints.getHscGroupSugg(
          className,
          yearID,
        ),
      );

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return HscGroupSuggModel.fromJson(data);
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
