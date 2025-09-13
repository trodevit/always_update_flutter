import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/honours_screen/honours_group/model/honours_group_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetHonoursGroupAPI {
  static final GetHonoursGroupAPI _singleton = GetHonoursGroupAPI._internal();
  GetHonoursGroupAPI._internal();

  static GetHonoursGroupAPI get instance => _singleton;

  Future<HonoursGroupModel> getHonoursGroupInfo({dynamic type}) async {
    try {
      Response response =
          await getHttp(Endpoints.getHonoursGroup(type));

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return HonoursGroupModel.fromJson(data);
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
