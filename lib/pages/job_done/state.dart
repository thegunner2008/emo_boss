import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class JobState {
  /// Data State

  final _timeStamp = Rx<DateTime?>(null);
  DateTime? get timeStamp => _timeStamp.value;
  void setTimeStamp(DateTime? value) => _timeStamp.value = value;

  final _count = RxInt(0);
  int get count => _count.value;
  void setCount(int value) => _count.value = value;

  final _jobs = RxList<Job>([]);
  List<Job> get jobs => _jobs;
  void setJobs(List<Job> value) => _jobs.value = value;

  void addJobs(ResponseList<Job> response) {
    setCount(response.metadata.totalItems);
    _jobs.addAll(response.data);
    _jobs.refresh();
  }

  void setDataState(ResponseList<Job> response) {
    setCount(response.metadata.totalItems);
    setJobs(response.data);
  }

  /// Logic Mobile
  RefreshController refreshController = RefreshController();
  LoadMoreCounter _loadMoreCounter = const LoadMoreCounter();

  LoadMoreCounter get loadMoreCounter => _loadMoreCounter;

  void setLoadMoreCounter(LoadMoreCounter value) => _loadMoreCounter = value;

  void resetRefreshController() => refreshController = RefreshController();

  void resetLoadMoreCounter() => setLoadMoreCounter(const LoadMoreCounter());

  /// Logic Web
  var totalJob = 0;

  void setTotalJob(int totalJob) => this.totalJob = totalJob;

  var selectedJob = Rx<Job?>(null);

  void setSelectedJob(Job? selectedJob) => this.selectedJob.value = selectedJob;

  final _isShowLeftPanel = true.obs;

  bool get isShowLeftPanel => _isShowLeftPanel.value;

  void setIsShowLeftPanel(bool isShowLeftPanel) => _isShowLeftPanel.value = isShowLeftPanel;
}
