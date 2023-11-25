import 'package:flutter/material.dart';
import 'package:emo_boss/common/router/router.dart';

class MenuModel {
  ScreenRouter? screenRouter;
  IconData icon;
  double width;
  List<MenuModel> children;
  final String? _title;
  final String? _key;
  final MenuStyleView menuStyle;
  final bool isVisible;

  String get title => _title ?? screenRouter?.title ?? '';

  String get key => _key ?? screenRouter?.name ?? '';

  /// [title] Show in Drawer or Appbar. If null then equal [screenRouter.title]
  ///
  /// [key] For testing. If null then equal [screenRouter.name]
  ///
  MenuModel({
    this.screenRouter,
    String? title,
    String? key,
    required this.icon,
    this.width = 160,
    this.children = const [],
    this.menuStyle = MenuStyleView.all,
    this.isVisible = true,
  })  : _title = title,
        _key = key;
}

enum MenuStyle { drawer, toolbar }

enum MenuStyleView { all, right, left }

