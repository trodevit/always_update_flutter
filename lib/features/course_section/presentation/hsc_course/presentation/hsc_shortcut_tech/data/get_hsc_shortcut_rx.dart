import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/data/get_hsc_shortcut_api.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/presentation/hsc_shortcut_tech/model/get_hsc_shortcut_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetHscShortcutRX extends RxResponseInt<HscShortcutModel> {
  final api = HscShortcutItemAPI.instance;

  GetHscShortcutRX({required super.empty, required super.dataFetcher});

  ValueStream<HscShortcutModel> get getHscShortcutRx => dataFetcher.stream;

  Future<void> hscShortcutRX({dynamic type, yearID}) async {
    try {
      final hscShortcutData = await api.getHscShortcutInfo(
        type: type,
        yearID: yearID,
      );
      handleSuccessWithReturn(hscShortcutData);
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
