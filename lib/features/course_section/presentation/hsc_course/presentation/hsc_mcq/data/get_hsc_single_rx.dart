import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/data/get_hsc_single_api.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_mcq/model/hsc_mcq_single_item.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class HscMcqSingleItemRX extends RxResponseInt<HscMcqSingelltemModel> {
  final api = HscMcqSingleItemAPI.instance;

  HscMcqSingleItemRX({required super.empty, required super.dataFetcher});

  ValueStream<HscMcqSingelltemModel> get getHscSingleItemRx =>
      dataFetcher.stream;

  Future<void> getHscSingleItemRX({dynamic type, classType, subjectId}) async {
    try {
      final hscSingleItemData = await api.hscPDFSubjectSingleInfo(
        type: type,
        classType: classType,
        subjectId: subjectId,
      );
      handleSuccessWithReturn(hscSingleItemData);
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
