import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/utils/extensions/extensions.dart';
import 'package:emo_boss/pages/job_done/index.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog/init_job_dialog.dart';

class JobDoneMobile extends StatelessWidget {
  JobDoneMobile({Key? key}) : super(key: key);

  final JobDoneController _controller = JobDoneController.to;

  User get user => UserStore.to.user;

  Future onClickAddJob(BuildContext context) async {
    if (kIsWeb) return;
    final jobInit = await showInitJobDialog(context);
    if (jobInit == null) return;

    if (context.mounted) {
      await context.pushNavigator<Job>(
        WebJobMobilePage(job: jobInit),
        transitionType: ContextPushTransitionType.rightToLeft,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () => onClickAddJob(context),
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverAppBar(
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.successColor, AppColor.successColor.withOpacity(0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Xin chào, ${user.fullName}!",
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Obx(
                      () => JobListHeaderWidget(
                        countItem: _controller.state.count,
                      ),
                    ),
                  ],
                ),
              ),
              collapseMode: CollapseMode.parallax,
            ),
            backgroundColor: AppColor.successColor,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
        body: const JobList(),
      ),
    );
  }
}
