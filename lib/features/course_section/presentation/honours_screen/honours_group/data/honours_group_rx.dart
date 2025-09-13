import 'dart:developer';
import 'package:always_update/features/course_section/presentation/honours_screen/honours_group/data/honours_group_api.dart';
import 'package:always_update/features/course_section/presentation/honours_screen/honours_group/model/honours_group_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetHonoursGroupRX
    extends RxResponseInt<HonoursGroupModel> {
  final api = GetHonoursGroupAPI.instance;

  GetHonoursGroupRX({required super.empty, required super.dataFetcher});

  ValueStream<HonoursGroupModel> get getHonoursGroupRx =>
      dataFetcher.stream;

  Future<void> honoursGroupRX({dynamic type}) async {
    try {
      final videoSuggestionData = await api.getHonoursGroupInfo(type: type);
      handleSuccessWithReturn(videoSuggestionData);
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
