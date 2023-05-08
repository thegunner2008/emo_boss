import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'user_item.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final UserController _controller = UserController.to;

  List<UserPlus> get users => _controller.state.users;

  @override
  void initState() {
    super.initState();
    _controller.state.resetRefreshController();
  }

  void _handleTapUser(
    BuildContext context, {
    required User user,
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
          itemCount: users.length,
          itemBuilder: _renderItem,
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, int index) => Obx(
        () {
          if (index >= users.length) return const SizedBox.shrink();
          final itemData = users[index];
          final Widget item = UserItem(
            isSelected: false,
            user: users[index],
            index: index,
            onTap: (user) => _handleTapUser(context, user: user),
          );
          if (index == 0) {
            return _wrapItemWithDivider(
              child: item,
              currentDate: itemData.updatedAt,
            );
          }
          DateTime? previousItemDate = users[index-1].updatedAt;
          if (DateUtils.isSameDay(itemData.updatedAt, previousItemDate)) {
            return item;
          }
          return _wrapItemWithDivider(
            child: item,
            currentDate: itemData.updatedAt,
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
