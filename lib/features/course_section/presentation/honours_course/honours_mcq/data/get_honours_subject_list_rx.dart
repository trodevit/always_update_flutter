import 'dart:developer';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/data/get_honours_subject_list_api.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_subject_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class HonoursSubjectRX extends RxResponseInt<HonoursSubjectModel> {
  final api = HonoursSubjectAPI.instance;

  HonoursSubjectRX({required super.empty, required super.dataFetcher});

  ValueStream<HonoursSubjectModel> get getHonoursSubjectRX => dataFetcher.stream;

  Future<void> honoursSubjectRX() async {
    try {
      final honoursSubjectData = await api.honoursSubjectInfo();
      handleSuccessWithReturn(honoursSubjectData);
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
