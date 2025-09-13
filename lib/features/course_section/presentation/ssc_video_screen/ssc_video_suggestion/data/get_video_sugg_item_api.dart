import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_suggestion/model/get_video_sugg_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetVideoSuggAPI {
  static final GetVideoSuggAPI _singleton = GetVideoSuggAPI._internal();
  GetVideoSuggAPI._internal();

  static GetVideoSuggAPI get instance => _singleton;

  Future<SscVideoSuggModel> groupVideoSuggestionInfo({dynamic type}) async {
    try {
      Response response =
          await getHttp(Endpoints.getSscVideoGroupSuggestion(type));

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return SscVideoSuggModel.fromJson(data);
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
