import 'package:flutter/material.dart';
import 'package:emo_boss/common/config/build_mode.dart';
import 'package:emo_boss/global.dart';
import 'package:emo_boss/my_app.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  await Global.init(buildMode: BuildMode.prod);
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(const MyApp());
}
