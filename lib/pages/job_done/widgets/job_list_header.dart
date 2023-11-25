import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class JobListHeaderWidget extends StatelessWidget {
  const JobListHeaderWidget({
    Key? key,
    required this.countItem,
  }) : super(key: key);

  final int countItem;

  static double _widthInfoItem(BuildContext context) {
    final double withItem = context.width - 3 * Insets.sm;
    return withItem * 0.5;
  }

  Widget _infoItem({
    required double width,
    required String title,
    required String info,
    required Color colorIcon,
    required IconData icon,
  }) {
    return SizedBox(
      width: width,
      child: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(Insets.sm),
            child: Icon(
              icon,
              color: colorIcon,
              size: IconSizes.med,
            ),
          ),
          HSpace(Insets.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyles.title1.copyWith(
                    color: AppColor.grey300,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                VSpace(Insets.sm),
                Text(
                  info,
                  style: TextStyles.title1.copyWith(
                    color: AppColor.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.sm),
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: Corners.medBorder,
      ),
      child: Wrap(
        runSpacing: Insets.med,
        children: <Widget>[
          _infoItem(
            width: _widthInfoItem(context),
            title: "Tổng Chiến dịch",
            info: countItem.toCurrencyStr,
            icon: Icons.inventory_outlined,
            colorIcon: AppColor.primaryColor,
          ),
          _infoItem(
            width: _widthInfoItem(context),
            title: "Tổng tiền",
            info: "đ",
            icon: Icons.attach_money,
            colorIcon: AppColor.warnColor,
          ),
        ],
      ),
    );
  }
}
