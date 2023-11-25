import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

part "more_detail.dart";

part "table_columns.dart";

class UserTableWidget extends StatelessWidget {
  const UserTableWidget({
    Key? key,
  }) : super(key: key);

  UserController get _controller => Get.find<UserController>();

  @override
  Widget build(BuildContext context) => WebDataTable<UserTotal>(
        controller: _controller.tableController,
        width: MediaQuery.of(context).size.width,
        tableColumns: _tableColumns,
        sortTableBy: sortTableBy,
        showerMoreContentRowWidget: MoreDetailWidget.new,
        handleChangeData: _controller.handleChangeData,
      );

  Comparable sortTableBy(UserTotal userTotal, String keyCol) {
    if (keyCol == UserColumnConstants.name) return userTotal.userName;

    if (keyCol == UserColumnConstants.fullName) return userTotal.fullName;

    if (keyCol == UserColumnConstants.email) return userTotal.email;

    if (keyCol == UserColumnConstants.createdDate) return userTotal.createdAt ?? DateTime.now();

    if (keyCol == UserColumnConstants.lastLogin) return userTotal.lastLogin ?? DateTime.now();

    if (keyCol == UserColumnConstants.countJob) return userTotal.countJob;

    if (keyCol == UserColumnConstants.countTransactions) return userTotal.countTransaction;

    return -1;
  }
}
