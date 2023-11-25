import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/config/config.dart';
import 'common/di/injector.dart';
import 'common/theme/theme.dart';

class Global {
  static FirebaseApp? firebaseApp;

  static final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  static Future init({BuildMode buildMode = BuildMode.prod}) async {
    WidgetsFlutterBinding.ensureInitialized();

    setSystemUi();
    Loading();
    buildMode.init();

    await AppInjector.initializeDependencies();
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.black12,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
