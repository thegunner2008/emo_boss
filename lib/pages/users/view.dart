import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/users/layouts/web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'layouts/layouts.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(UserController());
    _controller.initData();
  }

  Widget _renderUI(BuildContext context) {
    if (ConfigStore.to.screenWidth.isMobile) {
      return const UserMobile();
    }

    return const UserWeb();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return _renderUI(context);
      },
    );
  }
}
