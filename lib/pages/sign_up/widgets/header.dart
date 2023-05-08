import 'package:emo_boss/common/config/config.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:emo_boss/pages/sign_in/controller.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({Key? key}) : super(key: key);

  Widget _landscapeUI(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            AppImages.$appIcon,
            width: 240 * ConfigStore.to.scale,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _landscapeUI(context);
  }
}
