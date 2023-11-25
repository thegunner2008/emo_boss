import 'dart:ui';

import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:get/get.dart';

import '../../common/entities/entities.dart';
import '../../common/store/store.dart';
import 'state.dart';

class WithdrawController extends GetxController {
  static WithdrawController get to => Get.find<WithdrawController>();

  final state = WithdrawState();

  final tableController = WebDataTableController<Withdraw>();

  Future _handleInitData() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetWithdraws();

      tableController
        ..setTotalCount(100)
        ..setDataSources(state.withdraws);
    } catch (e) {
      CustomSnackBar.error(
        title: S.current.Loi,
        message: S.current.Da_co_loi_xay_ra,
      );
    }
  }

  Future initData() async {
    if (state.withdraws.isEmpty) {
      await Loading.openAndDismissLoading(_handleInitData);
    } else {
      _handleInitData();
    }
  }

  Future<Image?> getQrPayImage({required Withdraw withdraw, required double size}) async {
    final reply = WithdrawStore.to.getReply(withdraw);
    return await WithdrawStore.to.convertBankAccountToQrImage(
      withdraw: withdraw.copyWith(reply: reply),
      size: size,
    );
  }

  /// Call API
  Future _handleGetWithdraws() async {
    state.setDataState(await getWithdraws());
  }

  Future<ResponseList<Withdraw>> getWithdraws() => WithdrawStore.to.getWithdraws(
        page: state.loadMoreCounter.pageNumber,
        pageSize: state.loadMoreCounter.itemPerPages,
      );

  Future pay({required Withdraw withdraw}) async {
    try {
      final reply = WithdrawStore.to.getReply(withdraw);
      await WithdrawStore.to.payWithdraw(
        id: withdraw.id,
        reply: reply,
        userId: withdraw.userId,
      );
      await onRefresh();
      CustomSnackBar.success(
        title: S.current.Thanh_cong,
        message: "Cập nhật trạng thái thành công",
      );
    } catch (e) {
      CustomSnackBar.error(
        title: S.current.Loi,
        message: S.current.Da_co_loi_xay_ra,
      );
    }
  }

  /// Logic Mobile
  Future onLoading() async {
    if (state.withdraws.length >= state.count) {
      state.refreshController.loadComplete();
      return;
    }
    try {
      state.setLoadMoreCounter(state.loadMoreCounter.next());
      state.addWithdraws(await getWithdraws());
      state.refreshController.loadComplete();
    } catch (e) {
      state.refreshController.loadFailed();
    }
  }

  Future onRefresh() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetWithdraws();
      state.refreshController.refreshCompleted();
    } catch (e) {
      state.refreshController.refreshFailed();
    }
  }

  //web
  Future<List<Withdraw>> handleChangeData({required int page, required int pageSize}) async {
    try {
      final res = await WithdrawStore.to.getWithdraws(
        page: page,
        pageSize: pageSize,
      );

      state.setLoadMoreCounter(
        state.loadMoreCounter.copyWith(
          pageNumber: page,
          itemPerPages: pageSize,
        ),
      );
      return res.data;
    } catch (e) {
      return [];
    }
  }
}
