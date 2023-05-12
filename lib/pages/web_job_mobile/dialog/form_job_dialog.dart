import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';

import 'form_job.dart';

Future<Job?> showValuePageDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return CustomDialog.simpleDialog<Job>(
    context: context,
    titlePadding: EdgeInsets.only(
      top: Insets.med,
      bottom: 0,
    ),
    title: "Chiến dịch",
    content: SizedBox(
      width: size.width > 650.scaleSize ? 650.scaleSize : size.width,
      child: Padding(
          padding: EdgeInsets.all(Insets.lg),
          child: const SingleChildScrollView(
            child: FormJob(),
          )),
    ),
  );
}
