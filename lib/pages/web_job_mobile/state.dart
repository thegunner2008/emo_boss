import 'package:get/get.dart';

import '../../common/entities/entities.dart';

class GetJobState {
  final Rx<Job> _job = Rx<Job>(Job());

  Job get job => _job.value;

  setJob(Job value) => _job.value = value;

  StartJobResponse? startJobResponse;

  final keyWordHintId = 'search-key-hint';

  Uri get uriGoogle => Uri.parse(job.keyWord.isNotEmpty
      ? "https://www.google.com/search?q=${Uri.encodeComponent(job.keyWord)}"
      : "https://www.google.com/");

  final RxString _title = ''.obs;

  String get title => _title.value;

  setTitle(String value) => _title.value = value;

  final RxString _currentUrl = ''.obs;

  String get currentUrl => _currentUrl.value;

  setCurrentUrl(String value) => _currentUrl.value = value;

  final RxInt _indexPage = 0.obs;

  int get indexPage => _indexPage.value;

  final RxString _valuePage = ''.obs;

  String get valuePage => _valuePage.value;

  setIndexValuePage(int index, String value) {
    _indexPage.value = index;
    _valuePage.value = value;
  }
}

enum Event {
  startJob,
  timeOut,
  finishJob,
}
