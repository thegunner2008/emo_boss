import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:emo_boss/pages/setting/index.dart';
import 'package:emo_boss/pages/setting/widgets/widgets.dart';

import 'setting_fragment/setting_fragment.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  SettingController get controller => Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return SettingTileWidget(
      children: [
        SettingSwitcherWidget(
          title: S.current.Am_bao_thanh_toan,
          initialValue: AppConfigureStore.to.getAttribute<bool>(AppStorage.$prefLayoutNotificationRing),
          onChanged: (val) {
            controller.setAttribute<bool>(AppStorage.$prefLayoutNotificationRing, val);
          },
        ),
        SettingSwitcherWidget(
          title: S.current.Nhan_tin_nhan_thong_bao,
          initialValue: true,
          onChanged: (val) {
            controller.setAttribute<bool>(AppStorage.$prefNotificationsPay, val);
          },
        ),
      ],
    );
  }
}
