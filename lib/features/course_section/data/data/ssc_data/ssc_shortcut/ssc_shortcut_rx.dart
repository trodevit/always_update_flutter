import 'dart:developer';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_model.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_shortcut/ssc_shortcut_api.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetSscShortcutRX extends RxResponseInt<SscGroupSubjectModel> {
  final api = GetSscShortcutAPI.instance;

  GetSscShortcutRX({required super.empty, required super.dataFetcher});

  ValueStream<SscGroupSubjectModel> get getShortcutRx =>
      dataFetcher.stream;

  Future<void> getShortcutRX({dynamic type}) async {
    try {
      final getShortcutData = await api.getShortcutInfo(type: type);
      handleSuccessWithReturn(getShortcutData);
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
