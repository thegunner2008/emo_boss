import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UserMobile extends StatelessWidget {
  const UserMobile({Key? key}) : super(key: key);

  User get user => UserStore.to.user;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lịch sử rút tiền', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColor.successColor,
        ),
        body: Container(
          color: AppColor.primaryBackgroundSuperLight,
          child: const UserList(), //All status
        ),
      ),
    );
  }
}
