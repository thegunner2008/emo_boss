import 'package:flutter/material.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/utils/extensions/extensions.dart';
import 'package:emo_boss/pages/setting/payment_setup/view.dart';
import 'package:emo_boss/pages/setting/widgets/widgets.dart';

class PaymentSetupWidget extends StatelessWidget {
  const PaymentSetupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingTileWidget(
      children: [
        SettingNavigatorWidget(
          title: S.current.Thiet_lap_thanh_toan,
          icon: Icons.arrow_forward_ios_rounded,
          onTap: () => context.pushNavigator(
            const PaymentSetupPage(),
            transitionType: ContextPushTransitionType.rightToLeft,
          ),
        ),
      ],
    );
  }
}
