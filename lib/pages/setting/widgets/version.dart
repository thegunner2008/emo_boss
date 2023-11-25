import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/setting/index.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({Key? key}) : super(key: key);

  SettingController get controller => Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) => Container(
        color: AppColor.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          horizontal: Insets.sm,
          vertical: 17.scaleSize,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Phiên bản: ${snapshot.data?.version ?? ""}",
              style: TextStyles.title1.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.black800,
              ),
            ),
            HSpace.med,
            Text(
              "Ngày cập nhật: ${snapshot.data?.buildNumber.buildNumberToDateStr() ?? ""}",
              style: TextStyles.title1.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.grey600,
                fontSize: FontSizes.s12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
