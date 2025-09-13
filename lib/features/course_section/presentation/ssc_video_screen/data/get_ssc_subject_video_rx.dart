import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/data/get_ssc_subject_video_api.dart';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/model/ssc_video_subject_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class SscVideoSubjectRX extends RxResponseInt<SscVideoSubjectModel> {
  final api = GetSscSubjectVideoAPI.instance;

  SscVideoSubjectRX({required super.empty, required super.dataFetcher});

  ValueStream<SscVideoSubjectModel> get getSscVideoSubjectRx =>
      dataFetcher.stream;

  Future<void> sscVideoSubjectRX() async {
    try {
      final sscVideoSubjectData = await api.sscVideoSubjectInfo();
      handleSuccessWithReturn(sscVideoSubjectData);
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
