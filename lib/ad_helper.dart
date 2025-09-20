import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3185941464287385/6623285800';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
