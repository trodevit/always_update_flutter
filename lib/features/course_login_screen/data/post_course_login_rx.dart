// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers
import 'dart:developer';

import 'package:always_update/features/course_login_screen/data/post_course_login_api.dart';
import 'package:always_update/features/course_section/model/course_login_model.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/app_constants.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/toast.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/rx_base.dart';

/// Login RX
/// - অ্যাক্সেস (honours/ssc/hsc) চেক না হলে logged-in flag সেট হবে না, navigate-ও হবে না
/// - অ্যাক্সেস থাকলেই persist + navigate
final class PostCourseLoginRX extends RxResponseInt<CourseLoginModel> {
  final api = PostCourseLoginAPI.instance;

  PostCourseLoginRX({
    required super.empty,
    required super.dataFetcher,
  });

  ValueStream<CourseLoginModel> get getFileData => dataFetcher.stream;

  Future<bool> signIn({
    required dynamic email,
    required dynamic device_id,
    required dynamic password,
  }) async {
    try {
      final CourseLoginModel data = await api.courseSigninApi(
        email: email,
        device_id: device_id,
        password: password,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  // -------- Success Handling --------
  @override
  Future<bool> handleSuccessWithReturn(CourseLoginModel data) async {
    final _user = data.user;

    final String deviceId = _user?.deviceId ?? '';
    final dynamic id = _user?.id;

    final int honours = _user?.honors ?? 0;
    final int ssc = _user?.ssc ?? 0;
    final int hsc = _user?.hsc ?? 0;

    // ✅ Has access: persist + dio update
    await appData.write(kDeviceId, deviceId);
    await appData.write(kKeyUserID, id);
    await appData.write(kKeyIsLoggedIn, true);

    DioSingleton.instance.update(deviceId);

    dataFetcher.sink.add(data);

    return true;
  }

  // -------- Error Handling --------
  @override
  bool handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      final res = error.response;
      final code = res?.statusCode;
      final body = res?.data;

      if (code == 400) {
        final msg = (body is Map && body["error"] != null)
            ? body["error"].toString()
            : "Bad request";
        ToastUtil.showShortToast(msg);
      } else {
        final msg = (body is Map && body["message"] != null)
            ? body["message"].toString()
            : "Something went wrong";
        ToastUtil.showShortToast(msg);
      }
    } else {
      ToastUtil.showShortToast("Unexpected error occurred");
    }

    log("LOGIN ERROR -> $error");
    dataFetcher.sink.addError(error);
    return false;
  }
}
