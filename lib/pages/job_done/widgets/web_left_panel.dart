import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WebLeftPanelWidget extends StatelessWidget {
  const WebLeftPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace.med,
        ListTile(
          dense: true,
          textColor: AppColor.primaryColor,
          iconColor: AppColor.primaryColor,
          leading: const Icon(Icons.list_outlined),
          title: Text(S.current.Tim_kiem.toUpperCase(), style: TextStyles.title2),
        ),
        Padding(
          padding: EdgeInsets.all(Insets.sm),
          child: CustomSearchWidget(
            hintText: S.current.Nhap_tu_khoa_tim_kiem,
          ),
        ),
        VSpace.med,
        // WebVoucherDateFilterWidget(
        //   onChanged: (e) async {
        //     final controller = Get.find<JobDoneController>();
        //     e == DateTimeFilter.custom
        //         ? CustomDialog.show<MapEntry<DateTime?, DateTime?>>(
        //             context: context,
        //             builder: (context) => VoucherFilterDialog(
        //               initialFilter: controller.state.filter,
        //             ),
        //           ).then(
        //             (data) => controller.setWebFilter(
        //               dateFilter: e,
        //               dateKey: data,
        //             ),
        //           )
        //         : controller.setWebFilter(
        //             dateFilter: e,
        //             dateKey: const MapEntry(null, null),
        //           );
        //   },
        // ),
      ],
    );
  }
}
