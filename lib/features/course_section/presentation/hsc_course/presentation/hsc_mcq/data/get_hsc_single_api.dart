import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/model/hsc_mcq_single_item.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class HscMcqSingleItemAPI {
  static final HscMcqSingleItemAPI _singleton =
      HscMcqSingleItemAPI._internal();

  HscMcqSingleItemAPI._internal();

  static HscMcqSingleItemAPI get instance => _singleton;

  Future<HscMcqSingelltemModel> hscPDFSubjectSingleInfo({
    dynamic type, // * hsc year
    classType, // * science, humanities, business_studies
    subjectId, // * subject id
  }) async {
    try {
      Response response =
          await getHttp(Endpoints.getHscPDFSubjectSingleItem(
        type,
        classType,
        subjectId,
      ));

      // * Log useful debug info
      log('== Dio Response ==');
      log('Status: ${response.statusCode}');
      log('Data: ${response.data}');

      // * Accept both 200 and 201 as success
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(json.encode(response.data));
        return HscMcqSingelltemModel.fromJson(data);
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
