import 'dart:developer';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_group/ssc_group_suggestion_api.dart';
import 'package:always_update/features/course_section/data/data/ssc_data/ssc_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetSscGroupSuggestionRX
    extends RxResponseInt<SscGroupSubjectModel> {
  final api = GetSscGroupSuggestionAPI.instance;

  GetSscGroupSuggestionRX({required super.empty, required super.dataFetcher});

  ValueStream<SscGroupSubjectModel> get getGroupSuggestionRx =>
      dataFetcher.stream;

  Future<void> groupSuggestionRX({dynamic type}) async {
    try {
      final groupSuggestionData = await api.groupSuggestionInfo(type: type);
      handleSuccessWithReturn(groupSuggestionData);
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
