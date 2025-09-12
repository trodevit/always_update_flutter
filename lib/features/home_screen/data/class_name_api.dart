import 'dart:convert';
import 'package:always_update/features/home_screen/model/class_name_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetClassAPI {
  static final GetClassAPI _singleton = GetClassAPI._internal();
  GetClassAPI._internal();

  static GetClassAPI get instance => _singleton;

  Future<ClassNameModel> classNameInfo() async {
    try {
      Response response = await getHttp(Endpoints.getClass());

      // Log useful debug info
      print('== Dio Response ==');
      print('Status: ${response.statusCode}');
      print('Data: ${response.data}');

      // Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return ClassNameModel.fromJson(data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      print('== Dio Error ==');
      print(error);
      throw ErrorHandler.handle(error).failure;
    }
  }
}
