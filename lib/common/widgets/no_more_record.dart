import 'package:flutter/material.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';

@Deprecated(
  "It will delete in the future",
)
Widget noMoreRecord({
  EdgeInsets? padding,
}) {
  return Container(
    padding: padding ?? EdgeInsets.all(Insets.lg),
    alignment: Alignment.center,
    child: Text(
      S.current.Khong_con_du_lieu,
      style: TextStyles.title1.copyWith(
        color: AppColor.grey600,
      ),
    ),
  );
}
