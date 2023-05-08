import 'package:emo_boss/pages/withdraw/index.dart';
import 'package:flutter/material.dart';
import 'package:emo_boss/common/router/router.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:go_router/go_router.dart';

class AppRouterImpl implements AppRouter {
  @override
  GoRouter get router => _router;

  final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ScreenRouter.job.path,
    redirect: (context, state) {
      final UserStore userStore = UserStore.to;

      if (!userStore.isLogin.value &&
          (state.location == ScreenRouter.signIn.path ||
              state.location == ScreenRouter.signUp.path)) return null;

      if (!userStore.isLogin.value) return ScreenRouter.signIn.path;

      if (state.location == ScreenRouter.signIn.path ||
          state.location == ScreenRouter.signUp.path) {
        return ScreenRouter.job.path;
      }

      return null;
    },
    routes: [
      AppRouter.goRouteMain(ScreenRouter.main,
          routes: [
            AppRouter.goRoute(ScreenRouter.job, (state) => const JobDonePage()),
            AppRouter.goRoute(ScreenRouter.users, (state) => const UserPage()),
            AppRouter.goRoute(ScreenRouter.withdraw, (state) => const WithdrawPage()),
            AppRouter.goRoute(ScreenRouter.setting, (state) => const SettingPage()),
          ],
      ),
      AppRouter.goRoute(ScreenRouter.signIn, (state) => const SignInPage()),
    ],
    errorPageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const PageNotFound()),
    errorBuilder: (context, state) => const PageNotFound(),
  );
}
