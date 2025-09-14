import 'dart:developer';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/data/get_honours_single_api.dart';
import 'package:always_update/features/course_section/presentation/honours_course/honours_mcq/model/honours_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetHonoursSingleItemRX extends RxResponseInt<HonoursMcqModel> {
  final api = GetHonoursSingleItemAPI.instance;

  GetHonoursSingleItemRX({required super.empty, required super.dataFetcher});

  ValueStream<HonoursMcqModel> get getHonoursItemRx => dataFetcher.stream;

  Future<void> getHonoursItemRX({dynamic type, classType, subjectId}) async {
    try {
      final honoursItemData = await api.honoursPDFSubjectSingleInfo(
        type: type,
        classType: classType,
        subjectId: subjectId,
      );
      handleSuccessWithReturn(honoursItemData);
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
