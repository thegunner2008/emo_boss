import 'package:flutter/foundation.dart';

class BuildValues {
  BuildValues._();

  //Prod
  static const String $prodApiUrl = 'http://103.154.244.98:8000/';

  //dev
  static const String $devApiUrl = kIsWeb ? 'http://localhost:8000/' : 'http://192.168.1.101:8000/';
}
