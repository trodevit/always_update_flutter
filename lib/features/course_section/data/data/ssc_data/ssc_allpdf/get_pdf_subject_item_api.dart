import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_single_item_model.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '/networks/dio/dio.dart';

class GetPDFSubjectSingleItemAPI {
  static final GetPDFSubjectSingleItemAPI _singleton =
      GetPDFSubjectSingleItemAPI._internal();

  GetPDFSubjectSingleItemAPI._internal();

  static GetPDFSubjectSingleItemAPI get instance => _singleton;

  Future<SscPdfSubjectSingleItemModel> sscPDFSubjectSingleInfo({
    dynamic type,
    classType,
    subjectId,
  }) async {
    try {
      Response response = await getHttp(Endpoints.getSscPDFSubjectSingleItem(
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
        return SscPdfSubjectSingleItemModel.fromJson(data);
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
