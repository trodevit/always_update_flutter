import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/data/hsc_group_sugg_api.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_group_sugg/model/hsc_group_sugg_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetHscGroupSuggRX extends RxResponseInt<HscGroupSuggModel> {
  final api = GetHscGroupSuggAPI.instance;

  GetHscGroupSuggRX({
    required super.empty,
    required super.dataFetcher,
  });

  ValueStream<HscGroupSuggModel> get getHscGroupSuggRx => dataFetcher.stream;

  Future<void> getHscGroupSuggRX({
    dynamic className,
    dynamic yearID,
  }) async {
    try {
      final hscGroupSuggData = await api.getHscGroupSuggInfo(
        className: className,
        yearID: yearID,
      );
      handleSuccessWithReturn(hscGroupSuggData);
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
