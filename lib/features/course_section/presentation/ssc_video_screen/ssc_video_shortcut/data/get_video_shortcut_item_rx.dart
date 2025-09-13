import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_shortcut/data/get_video_shortcut_item_api.dart';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_shortcut/model/ssc_video_shortcut_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetVideoShortcutRX extends RxResponseInt<SscVideoShortcutModel> {
  final api = GetVideoShortcutAPI.instance;

  GetVideoShortcutRX({required super.empty, required super.dataFetcher});

  ValueStream<SscVideoShortcutModel> get getVideoShortcutRx =>
      dataFetcher.stream;

  Future<void> videoShortcutRX({dynamic type}) async {
    try {
      final videoShortcutData = await api.getVideoShortcutInfo(type: type);
      handleSuccessWithReturn(videoShortcutData);
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
