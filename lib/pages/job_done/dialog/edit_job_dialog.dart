import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';

import 'edit_job_form.dart';

Future showEditJobDialog({
  required BuildContext context,
  required Job job,
  bool hideDeleteButton = true,
}) {
  final size = MediaQuery.of(context).size;
  return CustomDialog.simpleDialog<Job>(
    context: context,
    titlePadding: EdgeInsets.only(
      top: Insets.med,
      bottom: 0,
    ),
    title: "Sửa Chiến dịch",
    content: SizedBox(
      width: size.width > 800.scaleSize ? 800.scaleSize : size.width,
      child: Padding(
        padding: EdgeInsets.all(Insets.lg),
        child: SingleChildScrollView(
          child: EditJobForm(
            job: job,
            hideDeleteButton: hideDeleteButton,
          ),
        ),
      ),
    ),
  );
}
