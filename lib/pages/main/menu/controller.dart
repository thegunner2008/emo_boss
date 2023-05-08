import 'package:flutter/material.dart';
import 'package:emo_boss/common/router/router.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MenuXController extends GetxController {
  static MenuXController get to => Get.find<MenuXController>();

  final GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  late final List<MenuModel> menuModels;

  @override
  void onInit() {
    super.onInit();
    menuModels = [
      MenuModel(
        screenRouter: ScreenRouter.job,
        icon: Icons.work_outline,
      ),
      MenuModel(
        screenRouter: ScreenRouter.users,
        icon: Icons.people_alt_rounded,
      ),
      MenuModel(
        screenRouter: ScreenRouter.withdraw,
        icon: Icons.attach_money_outlined,
      ),
      MenuModel(
        screenRouter: ScreenRouter.setting,
        icon: Icons.settings_outlined,
      ),
    ];
  }

  void handleRedirect(ScreenRouter? screenRouter, BuildContext context) {
    keyDrawer.currentState?.closeDrawer();
    if (screenRouter != null && MainController.to.state.currentPage != screenRouter) {
      context.go(screenRouter.path);
      MainController.to.state.setCurrentPage(screenRouter);
    }
  }

  Future<void> logout() => Loading.openAndDismissLoading(() => UserStore.to.onLogout());
}
