import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'job_item.dart';

class JobList extends StatefulWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final JobDoneController _controller = JobDoneController.to;

  @override
  void initState() {
    super.initState();
    _controller.state.resetRefreshController();
  }

  void _handleTapJob(
    BuildContext context, {
    required Job job,
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
          itemCount: _controller.state.jobs.length,
          itemBuilder: _renderItem,
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, int index) => Obx(
        () {
          if (index >= _controller.state.jobs.length) return const SizedBox.shrink();
          final itemData = _controller.state.jobs[index];
          DateTime? currentDate = itemData.createdAt;
          final Widget item = JobItem(
            isSelected: false,
            job: itemData,
            index: index,
            onTap: (Job job) => _handleTapJob(context, job: job),
          );
          if (index == 0) {
            return _wrapItemWithDivider(
              child: item,
              currentDate: currentDate,
            );
          }
          DateTime? previousItemDate = _controller.state.jobs[index-1].createdAt;
          if (DateUtils.isSameDay(currentDate, previousItemDate)) {
            return item;
          }
          return _wrapItemWithDivider(
            child: item,
            currentDate: currentDate,
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
