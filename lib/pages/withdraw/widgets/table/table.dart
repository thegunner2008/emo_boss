import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:emo_boss/pages/withdraw/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part "more_detail.dart";

part "table_columns.dart";

class WithdrawTableWidget extends StatelessWidget {
  const WithdrawTableWidget({
    Key? key,
  }) : super(key: key);

  WithdrawController get _controller => Get.find<WithdrawController>();

  @override
  Widget build(BuildContext context) => WebDataTable<Withdraw>(
        controller: _controller.tableController,
        width: MediaQuery.of(context).size.width,
        tableColumns: _tableColumns,
        sortTableBy: sortTableBy,
        showerMoreContentRowWidget: MoreDetailWidget.new,
        handleChangeData: _controller.handleChangeData,
      );

  Comparable sortTableBy(Withdraw withdraw, String keyCol) {
    if (keyCol == WithdrawColumnConstants.name) return withdraw.user.userName;

    if (keyCol == WithdrawColumnConstants.status) return "";

    if (keyCol == WithdrawColumnConstants.account) return withdraw.numberAccount;

    if (keyCol == WithdrawColumnConstants.createdDate) return withdraw.createdAt ?? DateTime.now();

    if (keyCol == WithdrawColumnConstants.expiredDate) return withdraw.updatedAt ?? DateTime.now();

    if (keyCol == WithdrawColumnConstants.status) return withdraw.status?.name ?? "";

    return -1;
  }
}
