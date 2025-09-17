import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/model/get_hsc_shortcut_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class HscShortcutItemAPI {
  static final HscShortcutItemAPI _singleton = HscShortcutItemAPI._internal();
  HscShortcutItemAPI._internal();

  static HscShortcutItemAPI get instance => _singleton;

  Future<HscShortcutModel> getHscShortcutInfo({
    dynamic type,
    yearID,
  }) async {
    try {
      Response response = await getHttp(
        Endpoints.getHscShortcutItem(
          type,
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
        return HscShortcutModel.fromJson(data);
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
