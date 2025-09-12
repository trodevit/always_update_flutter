
import 'package:always_update/features/home_screen/data/class_name_api.dart';
import 'package:always_update/features/home_screen/model/class_name_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetClassAPIRX extends RxResponseInt<ClassNameModel> {
  final api = GetClassAPI.instance;

  GetClassAPIRX({required super.empty, required super.dataFetcher});

  ValueStream<ClassNameModel> get getClassNameRx => dataFetcher.stream;

  Future<void> classNameRX() async {
    try {
      final classNameData = await api.classNameInfo();
      handleSuccessWithReturn(classNameData);
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