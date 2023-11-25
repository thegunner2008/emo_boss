import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../common/entities/entities.dart';
import 'state.dart';

class WebJobMobileController extends GetxController {
  static WebJobMobileController get to => Get.find();

  final state = GetJobState();

  WebJobMobileController();

  InAppWebViewController? _webViewController;

  final urlController = TextEditingController();

  final totalController = TextEditingController();

  final timeController = TextEditingController();

  final resetDaysController = TextEditingController(text: "1");

  final moneyController = TextEditingController();

  final factorController = TextEditingController(text: "1");

  void initState(Job job) {
    state.setJob(job);
    state.setIndexValuePage(0, "");
  }

  void setWebViewController(InAppWebViewController controller) => _webViewController = controller;

  void setUrl() {
    final uri = Uri.parse(state.currentUrl);
    state.setJob(state.job.copyWith(url: state.currentUrl, baseUrl: uri.host));
    urlController.text = state.currentUrl;
  }

  void handleValuePage() {
    _webViewController?.removeJavaScriptHandler(handlerName: Event.finishJob.name);
    _webViewController?.getTitle().then((value) {
      state.setIndexValuePage(99, value ?? "");
    });
  }

  void handleFinishJob(BuildContext context) {
    final job = state.job.copyWith(
      url: state.currentUrl,
      total: totalController.text.parseSafeInt,
      time: timeController.text.parseSafeInt,
      money: moneyController.text.parseSafeInt,
      keyPage: state.indexPage.toString(),
      valuePage: state.valuePage,
      factor: factorController.text.parseSafeDouble,
      resetDay: resetDaysController.text.parseSafeInt,
    );

    Loading.openAndDismissLoading(() async {
      await JobStore.to.createJob(job: job);
      if (context.mounted) {
        CustomDialog.showSuccess(
          context: context,
          content: 'Tạo mới thành công, trở lại màn hình chính?',
          onApply: context.pop,
        );
      }
    }, onError: (_) {
      CustomDialog.showError(
        context: context,
        content: 'Có lỗi xảy ra khi gửi kết quả?',
        // onApply: context.pop,
      );
    });
  }
}
