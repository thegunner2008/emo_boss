import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:emo_boss/common/generated/l10n.dart';

typedef AppBarBuilder = Function(Widget, ScreenRouter);

enum ScreenRouter {
  main('/'),
  job('/job'),
  users('/users'),
  webJob('/web-job'),
  notFound('/not-found'),
  signIn('/sign-in'),
  signUp('/sign-up'),
  setting('/setting'),
  withdraw('/withdraw'),
  createWithdraw('/create-withdraw'),
  test('/test');

  final String path;

  const ScreenRouter(this.path);

  static ScreenRouter? fromPath(String path) =>
      ScreenRouter.values.firstWhereOrNull((element) => element.path == path);

  static ScreenRouter? fromName(String name) =>
      ScreenRouter.values.firstWhereOrNull((element) => element.name == name);

  String get title {
    switch (this) {
      case main:
        return S.current.Trang_chu;
      case users:
        return "Users";
      case job:
        return "Chiến dịch";
      case webJob:
        return S.current.Nhan_hang;
      case setting:
        return S.current.Cai_dat;
      case notFound:
        return S.current.Khong_xac_dinh;
      case signIn:
        return S.current.Dang_nhap;
      case signUp:
        return S.current.Dang_ky;
      case withdraw:
        return "Rút tiền";
      case createWithdraw:
        return "Yêu cầu rút tiền";
      case test:
        return "Test";
    }
  }
}
