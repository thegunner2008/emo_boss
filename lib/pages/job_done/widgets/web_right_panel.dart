import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog/init_job_dialog.dart';

class WebRightPanelWidget extends StatelessWidget {
  const WebRightPanelWidget({Key? key}) : super(key: key);

  JobDoneController get _controller => Get.find<JobDoneController>();

  JobState get _state => _controller.state;

  Future onClickAddJob(BuildContext context) async {
    if (kIsWeb) return;
    final jobInit = await showInitJobDialog(context);
    if (jobInit == null) return;

    if (context.mounted) {
      await context.pushNavigator<Job>(
        WebJobMobilePage(job: jobInit),
        transitionType: ContextPushTransitionType.rightToLeft,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace.med,
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: Insets.xs),
          textColor: AppColor.primaryColor,
          iconColor: AppColor.primaryColor,
          leading: CustomButton.customFullColor(
            onPressed: () => _state.setIsShowLeftPanel(!_state.isShowLeftPanel),
            padding: EdgeInsets.all(6.scaleSize),
            child: Obx(
              () => Icon(
                _state.isShowLeftPanel
                    ? Icons.arrow_back_ios_new_outlined
                    : Icons.arrow_forward_ios_outlined,
              ),
            ),
          ),
          title: Text("Chiến dịch".toUpperCase(), style: TextStyles.title2),
          trailing: IntrinsicWidth(
            child: Row(
              children: [
                CustomButton.customFullColor(
                  onPressed: () {
                    onClickAddJob(context);
                  },
                  padding: EdgeInsets.all(Insets.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_circle),
                      HSpace.sm,
                      Text(S.current.Them_moi.toUpperCase()),
                    ],
                  ),
                ),
                HSpace.sm,
                CustomButton.customFullColor(
                  onPressed: () {},
                  padding: EdgeInsets.all(Insets.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_download_outlined),
                      HSpace.sm,
                      Text(S.current.Xuat_ra_file.toUpperCase()),
                    ],
                  ),
                ),
                HSpace.sm,
              ],
            ),
          ),
        ),
        VSpace.med,
        const Expanded(
          child: JobsTableWidget(),
        ),
      ],
    );
  }
}
