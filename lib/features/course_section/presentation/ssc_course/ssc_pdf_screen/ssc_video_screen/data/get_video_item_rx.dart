import 'dart:developer';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/data/get_video_item_api.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_video_screen/model/ssc_video_item_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class SscVideoItemRX extends RxResponseInt<SscVideoItemSubjectModel> {
  final api = SscVideoItemAPI.instance;

  SscVideoItemRX({required super.empty, required super.dataFetcher});

  ValueStream<SscVideoItemSubjectModel> get getSscVideoItemRX =>
      dataFetcher.stream;

  Future<void> sscVideoItemRX({dynamic classType, subjectId}) async {
    try {
      final sscPDFSubjectData = await api.sscVideoItemInfo(
        classType: classType,
        subjectId: subjectId,
      );
      handleSuccessWithReturn(sscPDFSubjectData);
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
