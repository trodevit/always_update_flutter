import 'dart:developer';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_allpdf/ssc_subject_api.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_pdf_subject_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class SscPDFSubjectRX extends RxResponseInt<SscPdfSubjectModel> {
  final api = SscPDFSubjectAPI.instance;

  SscPDFSubjectRX({required super.empty, required super.dataFetcher});

  ValueStream<SscPdfSubjectModel> get getSscPDFSubjectRx => dataFetcher.stream;

  Future<void> sscPDFSubjectRX() async {
    try {
      final sscPDFSubjectData = await api.sscPDFSubjectInfo();
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
