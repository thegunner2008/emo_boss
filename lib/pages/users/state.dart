import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserState {
  /// Data State
  final _timeStamp = Rx<DateTime?>(null);
  DateTime? get timeStamp => _timeStamp.value;
  void setTimeStamp(DateTime? value) => _timeStamp.value = value;

  final _count = RxInt(0);
  int get count => _count.value;
  void setCount(int value) => _count.value = value;

  final _totalMoney = RxInt(0);
  int get totalMoney => _totalMoney.value;

  final _users = RxList<UserTotal>([]);
  List<UserTotal> get users => _users;
  void setUsers(List<UserTotal> value) => _users.value = value;

  void addUsers(ResponseList<UserTotal> response) {
    setCount(response.metadata.totalItems);
    _users.addAll(response.data);
    _users.refresh();
  }

  void setDataState(ResponseList<UserTotal> response) {
    setCount(response.metadata.totalItems);
    setUsers(response.data);
  }

  /// Logic Mobile
  RefreshController refreshController = RefreshController();
  LoadMoreCounter _loadMoreCounter = const LoadMoreCounter();

  LoadMoreCounter get loadMoreCounter => _loadMoreCounter;

  void setLoadMoreCounter(LoadMoreCounter value) => _loadMoreCounter = value;

  void resetRefreshController() => refreshController = RefreshController();

  void resetLoadMoreCounter() => setLoadMoreCounter(const LoadMoreCounter());

  /// Logic Web
  var total = 0;

  void setTotal(int total) => this.total = total;

  var selectedUser = Rx<UserTotal?>(null);

  void setSelectedUser(UserTotal? selected) => selectedUser.value = selected;

  final _isShowLeftPanel = true.obs;

  bool get isShowLeftPanel => _isShowLeftPanel.value;

  void setIsShowLeftPanel(bool isShowLeftPanel) => _isShowLeftPanel.value = isShowLeftPanel;

}
