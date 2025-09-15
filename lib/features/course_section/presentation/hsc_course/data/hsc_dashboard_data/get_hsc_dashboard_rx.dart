import 'dart:developer';
import 'package:always_update/features/course_section/presentation/hsc_course/data/hsc_dashboard_data/get_hsc_dashboard_api.dart';
import 'package:always_update/features/course_section/presentation/hsc_course/model/hsc_year_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetHscYearRX extends RxResponseInt<HscYearModel> {
  final api = GetHscYearAPI.instance;

  GetHscYearRX({required super.empty, required super.dataFetcher});

  ValueStream<HscYearModel> get getHscYearRx => dataFetcher.stream;

  Future<void> getHscYearRX() async {
    try {
      final hscYearData = await api.getHscYearInfo();
      handleSuccessWithReturn(hscYearData);
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
