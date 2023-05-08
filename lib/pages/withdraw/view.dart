import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/withdraw/layouts/web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'layouts/layouts.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  late final WithdrawController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(WithdrawController());
    _controller.initData();
  }

  Widget _renderUI(BuildContext context) {
    if (ConfigStore.to.screenWidth.isMobile) {
      return const WithdrawMobile();
    }

    return const WithdrawWeb();
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
