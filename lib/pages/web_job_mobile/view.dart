import 'dart:async';

import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/router/router.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'dialog/form_job_dialog.dart';
import 'index.dart';

class WebJobMobilePage extends StatefulWidget {
  const WebJobMobilePage({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  State<WebJobMobilePage> createState() => _WebJobMobilePageState();
}

class _WebJobMobilePageState extends State<WebJobMobilePage> {
  final _controller = Get.put(WebJobMobileController());

  GetJobState get _state => _controller.state;

  @override
  void initState() {
    super.initState();
    _controller.initState(widget.job);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showConfirmFinish() => CustomDialog.showSuccess(
        context: context,
        content: 'Bạn đã hoàn thành công việc này, trở lại màn hình chính?',
        onApply: () => context.goNamed(ScreenRouter.job.name),
      );

  void _showConfirmError() => CustomDialog.showError(
        context: context,
        content: 'Có lỗi xảy ra khi gửi kết quả, trở lại màn hình chính?',
        onApply: context.pop,
      );

  Future _setCurrentUrl() async {
    _controller.setUrl();
    _controller.handleValuePage();
    await showValuePageDialog(context);
  }

  AppBar _appBar() => AppBar(
        title: const Text("Tạo chiến dịch", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: context.pop,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Obx(
              () => _state.job.url.isEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Trang đích: ${_state.currentUrl}",
                            style: TextStyle(
                              fontSize: FontSizes.s16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        HSpace.sm,
                        CustomButton.customFullColor(
                          onPressed: () => _setCurrentUrl(),
                          padding: EdgeInsets.all(Insets.sm),
                          child: const Icon(Icons.check),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: _state.uriGoogle,
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: _controller.setWebViewController,
        onLoadStop: (InAppWebViewController controller, Uri? url) async {
          if (url == null) return;
          _state.setCurrentUrl(url.toString());
          return;
        },
      ),
    );
  }
}
