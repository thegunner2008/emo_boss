import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/models/models.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.isSelected,
    required this.user,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final UserPlus user;
  final int index;
  final ValueChanged<User> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.med,
      ).copyWith(
        bottom: Insets.med,
      ),
      child: CustomButton.customFullColor(
        onPressed: () => onTap(user),
        clickColor: AppColor.grey300,
        background: _backgroundColorBtn(),
        padding: EdgeInsets.only(
          left: 0,
          right: Insets.sm,
          bottom: Insets.sm,
          top: Insets.sm,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 60.scaleSize,
              child: _renderIconData(index),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        user.userName,
                        style: TextStyles.title1.copyWith(
                          color: AppColor.black800,
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyles.title1.copyWith(
                          color: AppColor.grey600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        DateTime.now().fullDateAndTimeStr,
                        style: TextStyles.body1.copyWith(
                          color: AppColor.black800,
                        ),
                      ),
                      Text(
                        "Số lần/Số Job: ${user.totalJobs}/${user.totalJobsByIds}",
                        style: TextStyles.title1.copyWith(
                          color: AppColor.grey600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderIconData(int index) => Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.successColor,
          // borderRadius: Corners.lgBorder,
        ),
        alignment: Alignment.center,
        child: Text(
          "${index + 1}",
          style: TextStyles.title1.copyWith(color: AppColor.white),
        ),
      );

  Color _backgroundColorBtn() {
    Color color = AppColor.white;
    if (!isSelected) return color;
    if (ConfigStore.to.screenWidth.isTablet) return AppColor.grey300;
    return color;
  }
}
