import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/entities/entities.dart';
import '../../common/store/store.dart';
import 'state.dart';

class JobDoneController extends GetxController {
  static JobDoneController get to => Get.find<JobDoneController>();

  final state = JobState();

  final jobTableController = WebDataTableController<Job>();

  Future _handleInitData() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetJobs();

      jobTableController
        ..setTotalCount(100)
        ..setDataSources(state.jobs);
    } catch (e) {
      CustomSnackBar.error(
        title: S.current.Loi,
        message: S.current.Da_co_loi_xay_ra,
      );
    }
  }

  Future initData() async {
    if (state.jobs.isEmpty) {
      await Loading.openAndDismissLoading(_handleInitData);
    } else {
      _handleInitData();
    }
  }

  /// Call API
  Future _handleGetJobs() async {
    state.setDataState(await getJobs());
  }

  Future<ResponseList<Job>> getJobs() => JobStore.to.getJobs(
        page: state.loadMoreCounter.pageNumber,
        pageSize: state.loadMoreCounter.itemPerPages,
      );

  Future deleteJob({
    required BuildContext context,
    required Job job,
  }) =>
      Loading.openAndDismissLoading(
        () async {
          await JobStore.to.deleteJob(job: job);
          if (context.mounted) {
            CustomDialog.showSuccess(
              context: context,
              content: 'Xoá thành công?',
              onApply: () => _handleInitData(),
            );
          }
        },
        onError: (_) {
          CustomDialog.showError(
            context: context,
            content: 'Có lỗi xảy ra khi gửi kết quả?',
          );
        },
      );

  Future editJob({
    required BuildContext context,
    required Job job,
  }) =>
      Loading.openAndDismissLoading(
        () async {
          await JobStore.to.editJob(job: job);
          if (context.mounted) {
            CustomDialog.showSuccess(
              context: context,
              content: 'Sửa thành công?',
              onApply: () => _handleInitData(),
            );
          }
        },
        onError: (_) {
          CustomDialog.showError(
            context: context,
            content: 'Có lỗi xảy ra khi gửi kết quả?',
          );
        },
      );

  /// Logic Mobile
  Future onLoading() async {
    if (state.jobs.length >= state.count) {
      state.refreshController.loadComplete();
      return;
    }
    try {
      state.setLoadMoreCounter(state.loadMoreCounter.next());
      state.addJobs(await getJobs());
      state.refreshController.loadComplete();
    } catch (e) {
      state.refreshController.loadFailed();
    }
  }

  void onRefresh() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetJobs();
      state.refreshController.refreshCompleted();
    } catch (e) {
      state.refreshController.refreshFailed();
    }
  }

  //web
  Future<List<Job>> handleChangeData({required int page, required int pageSize}) async {
    try {
      final res = await JobStore.to.getJobs(
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
