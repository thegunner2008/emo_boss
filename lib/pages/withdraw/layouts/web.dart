import 'dart:async';

import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class WithdrawWeb extends StatefulWidget {
  const WithdrawWeb({Key? key}) : super(key: key);

  @override
  State<WithdrawWeb> createState() => _WithdrawWebState();
}

class _WithdrawWebState extends State<WithdrawWeb> {
  final _subscriptions = <StreamSubscription>[];
  final _controller = Get.find<WithdrawController>();
  final _debounce = Debounce(milliseconds: 1000);

  @override
  void initState() {
    _subscriptions.addAll([
      // SearchStream.to.stream.listen(
      //       (value) => _debounce.run(
      //         () => _controller.setWebFilter(searchKey: value),
      //   ),
      // ),
    ]);
    super.initState();
  }

  @override
  void dispose() {
    for (var s in _subscriptions) {
      s.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Visibility(
            visible: _controller.state.isShowLeftPanel,
            maintainState: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.2),
              child: const WebLeftPanelWidget(),
            ),
          ),
        ),
        Obx(
          () {
            return _controller.state.isShowLeftPanel ? const VerticalDivider() : const SizedBox();
          },
        ),
        const Expanded(
          child: WebRightPanelWidget(),
        ),
      ],
    );
  }
}
