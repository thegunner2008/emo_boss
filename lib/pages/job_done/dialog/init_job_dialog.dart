import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';

Future<Job?> showInitJobDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return CustomDialog.simpleDialog<Job>(
    context: context,
    titlePadding: EdgeInsets.only(
      top: Insets.med,
      bottom: 0,
    ),
    title: "Khởi tạo chiến dịch",
    content: SizedBox(
      width: size.width > 650.scaleSize ? 650.scaleSize : size.width,
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(Insets.lg),
        child: _Dialog(),
      ),
    ),
  );
}

class _Dialog extends StatelessWidget {
  _Dialog({
    Key? key,
  }) : super(key: key);

  final keyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: TextStyles.title2.copyWith(color: AppColor.black800),
            textAlign: TextAlign.center,
            "Từ khoá Google",
          ),
          VSpace.med,
          CustomInput.outline(
            controller: keyTextController,
            hintText: "Nhập từ khoá",
            height: 45.scaleSize,
            borderRadius: Corners.xl,
            padding: EdgeInsets.all(Insets.sm),
          ),
          VSpace.med,
          CustomButton.outline(
            onPressed: () {
              final job = Job(
                keyWord: keyTextController.text,
              );
              context.popNavigator(job);
            },
            width: double.infinity,
            height: 45.scaleSize,
            background: AppColor.primaryColor,
            textColor: AppColor.white,
            text: "Tiếp tục",
          ),
        ],
      );
}
