import 'dart:developer';

import 'package:always_update/features/course_section/data/course_api.dart';
import 'package:always_update/features/course_section/model/course_model.dart';
import 'package:always_update/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';

final class GetCourseAPIRX extends RxResponseInt<CourseModel> {
  final api = GetCourseAPI.instance;

  GetCourseAPIRX({required super.empty, required super.dataFetcher});

  ValueStream<CourseModel> get getCourseRx => dataFetcher.stream;

  Future<void> courseRX({
    required dynamic className,
    required dynamic topic,
    required dynamic email,
    required dynamic deviceID,
  }) async {
    try {
      final courseData = await api.courseInfo(
        className: className,
        topic: topic,
        email: email,
        deviceID: deviceID,
      );
      handleSuccessWithReturn(courseData);
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
