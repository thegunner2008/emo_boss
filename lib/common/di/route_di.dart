import 'package:get_it/get_it.dart';
import 'package:emo_boss/common/router/router.dart';

class RouteDI {
  RouteDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<AppRouter>(AppRouterImpl());
  }
}
