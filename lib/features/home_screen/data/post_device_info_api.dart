// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:always_update/features/home_screen/model/device_id_model.dart';
import 'package:always_update/helpers/toast.dart';
import 'package:always_update/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../networks/dio/dio.dart';

final class PostLoginApi {
  static final PostLoginApi _singleton = PostLoginApi._internal();

  PostLoginApi._internal();

  static PostLoginApi get instance => _singleton;

  Future<DeviceIdModel> deviceSigninApi({
    required String device_id,
    required dynamic device_name,
  }) async {
    try {
      // Create the request data map
      Map data = {
        "device_id": device_id,
        "device_name": device_name,
      };
      // Make the POST request
      Response response = (await postHttp(Endpoints.deviceIdLogin(), data));

      if (response.statusCode == 200) {
        DeviceIdModel data = DeviceIdModel.fromJson(
          json.decode(
            json.encode(
              response.data,
            ),
          ),
        );
        ToastUtil.showShortToast('Device Info Sent Successfully');
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      log("Error during signup: $error");
      rethrow;
    }
  }
}
