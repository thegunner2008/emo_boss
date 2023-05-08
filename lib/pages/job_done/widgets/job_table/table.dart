import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part "more_detail.dart";

part "table_columns.dart";

class JobsTableWidget extends StatelessWidget {
  const JobsTableWidget({
    Key? key,
  }) : super(key: key);

  JobDoneController get _controller => Get.find<JobDoneController>();

  @override
  Widget build(BuildContext context) => WebDataTable<Job>(
        controller: _controller.jobTableController,
        width: MediaQuery.of(context).size.width,
        tableColumns: _tableColumns,
        sortTableBy: sortTableBy,
        showerMoreContentRowWidget: MoreDetailWidget.new,
        handleChangeData: _controller.handleChangeData,
      );

  Comparable sortTableBy(Job job, String keyCol) {
    if (keyCol == JobColumnConstants.name) return job.baseUrl;

    if (keyCol == JobColumnConstants.status) return "";

    if (keyCol == JobColumnConstants.value) return job.money;

    if (keyCol == JobColumnConstants.createdDate) return job.createdAt ?? DateTime.now();

    if (keyCol == JobColumnConstants.expiredDate) return job.updatedAt ?? DateTime.now();

    if (keyCol == JobColumnConstants.count) return job.count;

    return -1;
  }
}
