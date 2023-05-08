import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/models/models.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';

class JobItem extends StatelessWidget {
  const JobItem({
    Key? key,
    required this.isSelected,
    required this.job,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final Job job;
  final int index;
  final ValueChanged<Job> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.med,
      ).copyWith(
        bottom: Insets.med,
      ),
      child: CustomButton.customFullColor(
        onPressed: () => onTap(job),
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
                        job.baseUrl,
                        style: TextStyles.title1.copyWith(
                          color: AppColor.black800,
                        ),
                      ),
                      _renderStatus(status: JobState.done),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        job.createdAt.fullDateAndTimeStr,
                        style: TextStyles.body1.copyWith(
                          color: AppColor.black800,
                        ),
                      ),
                      // _renderTotalPayment(
                      //   job.money,
                      //   JobState.done,
                      // ),
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

  Widget _renderStatus({JobState status = JobState.done}) {
    late Color color;
    switch (status) {
      case JobState.done:
        color = AppColor.successColor;
        break;
      case JobState.cancel:
        color = AppColor.errorColor;
        break;
      case JobState.pending:
        color = AppColor.yellowColor;
        break;
    }
    return Text(
      status.getNameStatus,
      style: TextStyles.title1.copyWith(color: color),
    );
  }

  Widget _renderTotalPayment(int total, JobState status) {
    Color color = AppColor.warnColor;
    if (status == JobStatus.done) {
      color = AppColor.blueLight;
    } else if (status == JobState.cancel) {
      color = AppColor.errorColor;
    }
    return Text(
      "${truncateNumberToString(total)}đ",
      style: TextStyles.title1.copyWith(color: color),
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
