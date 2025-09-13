import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_suggestion/data/get_video_sugg_item_api.dart';
import 'package:always_update/features/course_section/presentation/ssc_video_screen/ssc_video_suggestion/model/get_video_sugg_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetVideoSuggRX
    extends RxResponseInt<SscVideoSuggModel> {
  final api = GetVideoSuggAPI.instance;

  GetVideoSuggRX({required super.empty, required super.dataFetcher});

  ValueStream<SscVideoSuggModel> get getVideoSuggestionRx =>
      dataFetcher.stream;

  Future<void> videoSuggestionRX({dynamic type}) async {
    try {
      final videoSuggestionData = await api.groupVideoSuggestionInfo(type: type);
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
