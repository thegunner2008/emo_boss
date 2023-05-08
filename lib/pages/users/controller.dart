import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:get/get.dart';

import '../../common/entities/entities.dart';
import '../../common/store/store.dart';
import 'state.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();

  final state = UserState();

  final tableController = WebDataTableController<UserPlus>();

  Future _handleInitData() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetUsers();

      tableController
        ..setTotalCount(100)
        ..setDataSources(state.users);
    } catch (e) {
      CustomSnackBar.error(
        title: S.current.Loi,
        message: S.current.Da_co_loi_xay_ra,
      );
    }
  }

  Future initData() async {
    if (state.users.isEmpty) {
      await Loading.openAndDismissLoading(_handleInitData);
    } else {
      _handleInitData();
    }
  }

  /// Call API
  Future _handleGetUsers() async {
    state.setDataState(await getUsers());
  }

  Future<ResponseList<UserPlus>> getUsers() => UserStore.to.getUsers(
        page: state.loadMoreCounter.pageNumber,
        pageSize: state.loadMoreCounter.itemPerPages,
      );

  Future<UserPlus> getUser(int userId) => UserStore.to.getUserPlus(userId: userId);

  /// Logic Mobile
  Future onLoading() async {
    if (state.users.length >= state.count) {
      state.refreshController.loadComplete();
      return;
    }
    try {
      state.setLoadMoreCounter(state.loadMoreCounter.next());
      state.addUsers(await getUsers());
      state.refreshController.loadComplete();
    } catch (e) {
      state.refreshController.loadFailed();
    }
  }

  void onRefresh() async {
    try {
      state.resetLoadMoreCounter();
      await _handleGetUsers();
      state.refreshController.refreshCompleted();
    } catch (e) {
      state.refreshController.refreshFailed();
    }
  }

  //web
  Future<List<UserPlus>> handleChangeData({required int page, required int pageSize}) async {
    try {
      final res = await UserStore.to.getUsers(
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
