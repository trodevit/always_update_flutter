// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers
import 'dart:developer';

import 'package:always_update/features/home_screen/data/post_device_info_api.dart';
import 'package:always_update/features/home_screen/model/device_id_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/di.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/rx_base.dart';

final class PostLoginRX extends RxResponseInt<DeviceIdModel> {
  final api = PostLoginApi.instance;

  PostLoginRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signIn({
    required String deviceId,
    required dynamic deviceName,
  }) async {
    try {
      // Call the sign-in API
      DeviceIdModel data = await api.deviceSigninApi(
        device_id: deviceId,
        device_name: deviceName,
      );
      await handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      // Handle error
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(DeviceIdModel data) async {
    // Extract the token from the response
    String deviceId = data.data!.deviceId;
    dynamic id = data.data!.id!;

    log("===============Send Device ID:- $deviceId");

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
        log(error.response!.data["error"]);
      } else {
        // Show general message for other status codes
        log(error.response!.data["message"]);
      }
    }
    // Log the error and add it to the stream
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
