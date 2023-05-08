import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'withdraw_item.dart';

class WithdrawList extends StatefulWidget {
  const WithdrawList({this.statusFilter, Key? key}) : super(key: key);

  final WithdrawStatus? statusFilter;

  @override
  State<WithdrawList> createState() => _WithdrawListState();
}

class _WithdrawListState extends State<WithdrawList> {
  final WithdrawController _controller = WithdrawController.to;

  List<Withdraw> get withdraws => _controller.state.withdraws
      .where((e) => e.status == widget.statusFilter || widget.statusFilter == null)
      .toList();

  @override
  void initState() {
    super.initState();
    _controller.state.resetRefreshController();
  }

  void _handleTapWithdraw(
    BuildContext context, {
    required Withdraw withdraw,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppRefresher(
        controller: _controller.state.refreshController,
        onRefresh: _controller.onRefresh,
        onLoading: _controller.onLoading,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: Insets.med),
          key: Key(AppKey.$scrollViewKey),
          itemCount: withdraws.length,
          itemBuilder: _renderItem,
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, int index) => Obx(
        () {
          if (index >= withdraws.length) return const SizedBox.shrink();
          final itemData = withdraws[index];
          final Widget item = WithdrawItem(
            isSelected: false,
            withdraw: withdraws[index],
            index: index,
            onTap: (withdraw) => _handleTapWithdraw(context, withdraw: withdraw),
          );
          if (index == 0) {
            return _wrapItemWithDivider(
              child: item,
              currentDate: itemData.updatedAt,
            );
          }
          DateTime? previousItemDate = withdraws[index-1].updatedAt;
          if (DateUtils.isSameDay(itemData.updatedAt, previousItemDate)) {
            return item;
          }
          return _wrapItemWithDivider(
            child: item,
            currentDate: itemData.updatedAt,
          );
        },
      );

  Widget _wrapItemWithDivider({
    required Widget child,
    DateTime? currentDate,
  }) {
    return Column(
      children: <Widget>[
        _dividerInList(currentDate),
        child,
      ],
    );
  }

  Widget _dividerInList(DateTime? currentDate) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: Insets.med,
        bottom: Insets.med,
      ),
      child: Text(
        currentDate != null ? '${currentDate.dayOfWeek}, ${currentDate.dateStr}' : '',
        style: TextStyles.title1.copyWith(
          color: AppColor.grey600,
        ),
      ),
    );
  }
}
