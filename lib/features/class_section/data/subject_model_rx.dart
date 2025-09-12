import 'package:always_update/features/class_section/data/subject_model_api.dart';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetSubjectAPIRX extends RxResponseInt<SubjectModel> {
  final api = GetSubjectAPI.instance;

  GetSubjectAPIRX({required super.empty, required super.dataFetcher});

  ValueStream<SubjectModel> get getSubjectRx => dataFetcher.stream;

  Future<void> subjectRX({
    required dynamic className,
    required dynamic topic,
  }) async {
    try {
      final subjectData = await api.subjectInfo(
        className: className,
        topic: topic,
      );
      handleSuccessWithReturn(subjectData);
    } catch (error) {
      print('== RX Error ==');
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
