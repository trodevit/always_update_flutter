import 'package:always_update/features/home_screen/presentation/home_screen.dart';
import 'package:always_update/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'networks/dio/dio.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  bool isFirstTime = false;

  @override
  void initState() {
    loadInitialData();

    super.initState();
  }

  loadInitialData() async {
    //AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);

      // await getFavouriteApiRX.favouriteInfoRX();
      // await getQuestionApiRXObj.questionInfoRX();
      // await getNoticeApiRXObj.noticeInfoRX();
      // await getProfileApiRXObj.profileInfoRX();
    } else {
      //  NotificationService().cancelAllNotifications();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen(); // Add a progress indicator here
    } else {
      // Handle navigation based on app state
      //bool isFirstTime = appData.read(kKeyIsFirstTime) ?? true;
      bool isLoggedIn = appData.read(kKeyIsLoggedIn) ?? false;

      if (isFirstTime) {
        return const WelcomeScreen();
      } else if (isLoggedIn) {
        return HomeScreen();
      } else {
        return const HomeScreen();
      }
    }
  }
}
