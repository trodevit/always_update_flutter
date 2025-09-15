import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/data/get_hsc_subject_api.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/model/hsc_mcq_subject_list_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class HscSubjectRX extends RxResponseInt<HscMcqSubListModel> {
  final api = HscSubjectAPI.instance;

  HscSubjectRX({required super.empty, required super.dataFetcher});

  ValueStream<HscMcqSubListModel> get getHscSubjectRX => dataFetcher.stream;

  Future<void> hscSubjectRX() async {
    try {
      final hscSubjectData = await api.hscSubjectInfo();
      handleSuccessWithReturn(hscSubjectData);
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
