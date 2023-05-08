import 'package:collection/collection.dart';
import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../index.dart';
import 'constants.dart';

part "more_detail.dart";

part "table_columns.dart";

class UserTableWidget extends StatelessWidget {
  const UserTableWidget({
    Key? key,
  }) : super(key: key);

  UserController get _controller => Get.find<UserController>();

  @override
  Widget build(BuildContext context) => WebDataTable<UserPlus>(
        controller: _controller.tableController,
        width: MediaQuery.of(context).size.width,
        tableColumns: _tableColumns,
        sortTableBy: sortTableBy,
        showerMoreContentRowWidget: MoreDetailWidget.new,
        handleChangeData: _controller.handleChangeData,
      );

  Comparable sortTableBy(UserPlus user, String keyCol) {
    if (keyCol == UserColumnConstants.name) return user.userName;

    if (keyCol == UserColumnConstants.fullName) return user.fullName;

    if (keyCol == UserColumnConstants.email) return user.email;

    if (keyCol == UserColumnConstants.createdDate) return user.createdAt ?? DateTime.now();

    if (keyCol == UserColumnConstants.lastLogin) return user.lastLogin ?? DateTime.now();

    if (keyCol == UserColumnConstants.totalJobsById) return user.totalJobsByIds;

    if (keyCol == UserColumnConstants.totalJobs) return user.totalJobs;

    return -1;
  }
}
