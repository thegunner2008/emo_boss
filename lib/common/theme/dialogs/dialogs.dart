import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/buttons.dart';
import '../spaces/spaces.dart';

class CustomDialog {
  const CustomDialog._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) =>
      showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder,
        routeSettings: RouteSettings(
          name: builder(context).runtimeType.toString(),
        ),
      );

  static Future<bool?> defaultDialog(
    BuildContext context, {
    double? width,
    double? height,
    bool barrierDismissible = true,
    Color? barrierColor,
    EdgeInsets? insetsPadding,
    AlignmentGeometry? alignment,
    BorderRadiusGeometry? borderRadius,
    required Widget content,
  }) {
    final widthDefault = min(context.width, 550.scaleSize);
    return showDialog(
      barrierColor: barrierColor ?? Colors.black54,
      context: context,
      barrierDismissible: barrierDismissible,
      routeSettings: RouteSettings(
        name: content.runtimeType.toString(),
      ),
      builder: (BuildContext context) => Dialog(
        insetPadding: insetsPadding,
        alignment: alignment,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: width ?? widthDefault,
          height: height,
          decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.rectangle,
            borderRadius: borderRadius ?? Corners.medBorder,
            boxShadow: Shadows.cards,
          ),
          child: content,
        ),
      ),
    );
  }

  static Future<T?> simpleDialog<T>({
    required BuildContext context,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
    EdgeInsetsGeometry actionsPadding = EdgeInsets.zero,
    required String title,
    required Widget content,
    Widget? prefixAction,
    List<Widget>? actions,
    Color? backgroundColor,
  }) =>
      showDialog<T>(
        context: context,
        routeSettings: RouteSettings(
          name: content.runtimeType.toString(),
        ),
        builder: (context) {
          return AlertDialog(
            titlePadding: titlePadding,
            contentPadding: contentPadding,
            actionsPadding: actionsPadding,
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: prefixAction ?? const SizedBox.shrink(),
                ),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.title1.copyWith(
                      color: AppColor.black800,
                    ),
                  ),
                ),
              ],
            ),
            content: content,
            actions: actions,
            backgroundColor: backgroundColor,
          );
        },
      );

  static Future<bool?> delete(
    BuildContext context, {
    required VoidCallback onDelete,
    VoidCallback? onCancel,
    String? title,
    Widget? customTitle,
    String? content,
    String? buttonText,
    Widget? customContent,
    double? width,
  }) =>
      defaultDialog(
        context,
        width: width,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Insets.med),
              decoration: const BoxDecoration(
                color: AppColor.errorColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Corners.med),
                  topRight: Radius.circular(Corners.med),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: IconSizes.xl,
                  ),
                  VSpace.med,
                  customTitle ??
                      Text(
                        title ?? S.current.Ban_co_chac_chan_khong,
                        textAlign: TextAlign.center,
                        style: TextStyles.title1.copyWith(color: AppColor.white),
                        maxLines: 3,
                      ),
                ],
              ),
            ),
            VSpace.med,
            customContent ??
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.med),
                  child: Text(
                    content ?? S.current.Ban_hay_kiem_tra_lai_thong_tin,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyles.title2.copyWith(color: AppColor.black800),
                    maxLines: 4,
                  ),
                ),
            VSpace.med,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton.fullColor(
                      onPressed: () {
                        if (onCancel != null) {
                          onCancel();
                        } else {
                          context.popNavigator();
                        }
                      },
                      text: S.current.Huy,
                      background: AppColor.grey600WithOpacity500,
                    ),
                  ),
                  HSpace.med,
                  Expanded(
                    child: CustomButton.fullColor(
                      onPressed: onDelete,
                      text: buttonText ?? S.current.Xoa,
                      background: AppColor.errorColor,
                    ),
                  ),
                ],
              ),
            ),
            VSpace.med,
          ],
        ),
      );

  static Future<bool?> warning(
    BuildContext context, {
    required VoidCallback onSelectWarningBtn,
    VoidCallback? onCancel,
    String? title,
    Widget? customTitle,
    String? content,
    Widget? customContent,
    String? textBtnWarning,
    double? width,
  }) =>
      defaultDialog(
        context,
        width: width,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Insets.med),
              decoration: const BoxDecoration(
                color: AppColor.warnColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Corners.med),
                  topRight: Radius.circular(Corners.med),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: IconSizes.xl,
                  ),
                  VSpace.med,
                  customTitle ??
                      Text(
                        title ?? S.current.Ban_co_chac_chan_khong,
                        textAlign: TextAlign.center,
                        style: TextStyles.title1.copyWith(color: AppColor.white),
                        maxLines: 3,
                      ),
                ],
              ),
            ),
            VSpace.med,
            customContent ??
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.med),
                  child: Text(
                    content ?? S.current.Ban_hay_kiem_tra_lai_thong_tin,
                    style: TextStyles.title2.copyWith(color: AppColor.black800),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                ),
            VSpace.med,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton.fullColor(
                      onPressed: () {
                        if (onCancel != null) {
                          onCancel();
                        } else {
                          context.popNavigator();
                        }
                      },
                      text: S.current.Huy,
                      background: AppColor.grey600WithOpacity500,
                    ),
                  ),
                  HSpace.med,
                  Expanded(
                    child: CustomButton.fullColor(
                      onPressed: onSelectWarningBtn,
                      text: textBtnWarning ?? S.current.Chinh_sua,
                      background: AppColor.warnColor,
                    ),
                  ),
                ],
              ),
            ),
            VSpace.med,
          ],
        ),
      );

  static Future<bool?> info(
    BuildContext context, {
    VoidCallback? onSelectInfoBtn,
    required String title,
    Widget? customTitle,
    required String content,
    Widget? customContent,
    double? width,
  }) =>
      defaultDialog(
        context,
        width: width,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Insets.med),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Corners.med),
                  topRight: Radius.circular(Corners.med),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                    size: IconSizes.xl,
                  ),
                  VSpace.med,
                  customTitle ??
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyles.title1.copyWith(color: AppColor.white),
                      ),
                ],
              ),
            ),
            VSpace.med,
            customContent ??
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Insets.med),
                  child: Text(
                    content,
                    style: TextStyles.title2.copyWith(color: AppColor.black800),
                  ),
                ),
            VSpace.med,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: CustomButton.fullColor(
                width: double.infinity,
                onPressed: onSelectInfoBtn ?? () {},
                text: 'OK',
                background: Theme.of(context).primaryColor,
              ),
            ),
            VSpace.med,
          ],
        ),
      );

  static void showSuccess({
    required BuildContext context,
    String title = 'Thành công',
    required String content,
    VoidCallback? onApply,
  }) =>
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: title,
        desc: content,
        btnOkOnPress: onApply,
        btnOkIcon: Icons.check_circle,
      ).show();

  static void showError({
    required BuildContext context,
    String title = 'Không thành công',
    required String content,
    VoidCallback? onApply,
  }) =>
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        title: title,
        desc: content,
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
}
