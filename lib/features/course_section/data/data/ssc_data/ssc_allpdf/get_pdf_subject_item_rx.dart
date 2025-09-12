import 'dart:developer';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_allpdf/get_pdf_subject_item_api.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_single_item_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetPDFSubjectSingleItemRX extends RxResponseInt<SscPdfSubjectSingleItemModel> {
  final api = GetPDFSubjectSingleItemAPI.instance;

  GetPDFSubjectSingleItemRX({required super.empty, required super.dataFetcher});

  ValueStream<SscPdfSubjectSingleItemModel> get getGetPDFSubjectSingleItemRx => dataFetcher.stream;

  Future<void> getPDFSubjectSingleItemRX({dynamic type, classType, subjectId}) async {
    try {
      final sscPDFSubjectData = await api.sscPDFSubjectSingleInfo(
        type: type,
        classType: classType,
        subjectId: subjectId,
      );
      handleSuccessWithReturn(sscPDFSubjectData);
    } catch (error) {
      log('== RX Error ==');
      print(error);
      handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) {
    dataFetcher.sink.add(data);
    return data;
  }
}
