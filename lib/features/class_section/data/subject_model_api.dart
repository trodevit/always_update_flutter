import 'dart:convert';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetSubjectAPI {
  static final GetSubjectAPI _singleton = GetSubjectAPI._internal();
  GetSubjectAPI._internal();

  static GetSubjectAPI get instance => _singleton;

  Future<SubjectModel> subjectInfo({
    required dynamic className,
    required dynamic topic,
  }) async {
    try {
      Response response = await getHttp(Endpoints.getSubject(
        className,
        topic,
      ));

      // Log useful debug info
      print('== Dio Response ==');
      print('Status: ${response.statusCode}');
      print('Data: ${response.data}');

      // Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return SubjectModel.fromJson(data);
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
