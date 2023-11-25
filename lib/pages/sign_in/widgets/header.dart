import 'package:flutter/material.dart';
import 'package:emo_boss/common/config/config.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:emo_boss/pages/sign_in/controller.dart';

class SignInHeader extends StatelessWidget {
  SignInHeader({Key? key}) : super(key: key);

  final SignInController _signInController = SignInController.to;

  /// constants only in widgets
  static final _heightBtn = 28 * ConfigStore.to.scale;

  /// =========================

  Widget _landscapeUI(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            AppImages.appIcon,
            width: 240 * ConfigStore.to.scale,
          ),
          Positioned(
            top: Insets.xs,
            left: 0,
            child: CustomButton.customFullColor(
              height: _heightBtn,
              background: AppColor.primaryColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CustomIcons.phone,
                    size: IconSizes.sm,
                    color: AppColor.white,
                  ),
                  HSpace(Insets.xs),
                  Flexible(
                    child: Text(
                      $phoneSupport,
                      style: TextStyles.body2.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(Insets.xs),
              onPressed: _signInController.handleCallSupport,
            ),
          )
        ],
      ),
    );
  }

  Widget _portraitUI() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          AppImages.appIcon,
          width: 85 * ConfigStore.to.scale,
        ),
        Flexible(
          child: CustomButton.customFullColor(
            height: _heightBtn,
            background: AppColor.primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CustomIcons.phone,
                  size: IconSizes.sm,
                  color: AppColor.white,
                ),
                HSpace(Insets.xs),
                Flexible(
                  child: Text(
                    $phoneSupport,
                    style: TextStyles.body2.copyWith(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(Insets.xs),
            onPressed: _signInController.handleCallSupport,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConfigStore.to.screenWidth != ScreenWidth.mobile
        ? _landscapeUI(context)
        : _portraitUI();
  }
}
