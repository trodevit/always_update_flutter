import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_shortcut/model/ssc_video_shortcut_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetVideoShortcutAPI {
  static final GetVideoShortcutAPI _singleton = GetVideoShortcutAPI._internal();
  GetVideoShortcutAPI._internal();

  static GetVideoShortcutAPI get instance => _singleton;

  Future<SscVideoShortcutModel>getVideoShortcutInfo({dynamic type}) async {
    try {
      Response response =
          await getHttp(Endpoints.getVideoShortcut(type));

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return SscVideoShortcutModel.fromJson(data);
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
