// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers
import 'dart:developer';
import 'package:always_update/features/course_section/data/post_course_login_api.dart';
import 'package:always_update/features/course_section/model/course_login_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/toast.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/rx_base.dart';

final class PostCourseLoginRX extends RxResponseInt<CourseLoginModel> {
  final api = PostCourseLoginAPI.instance;

  PostCourseLoginRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signIn({
    required dynamic email,
    required dynamic device_id,
    required dynamic password,
  }) async {
    try {
      // Call the sign-in API
      CourseLoginModel data = await api.courseSigninApi(
        email: email,
        device_id: device_id,
        password: password,
      );
      await handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      // Handle error
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(CourseLoginModel data) async {
    // Extract the token from the response
    String deviceId = data.user!.deviceId!;
    dynamic id = data.user!.id!;

    log("===============> Send Device ID:- $deviceId");

    // Save the token and login status using appData
    await appData.write(kDeviceId, deviceId);
    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyUserID, id);
    // await appData.write(kKeyIsSubscribe, isSubscribe);

    // Update DioSingleton with the new token
    DioSingleton.instance.update(deviceId);
    // NavigationService.navigateTo(Routes.navigationUser);

    // Add the data to the stream
    dataFetcher.sink.add(data);

    return true;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    // Handle API error using DioException
    if (error is DioException) {
      if (error.response!.statusCode == 400) {
        // Show error message from the response
        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        // Show general message for other status codes
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    // Log the error and add it to the stream
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
