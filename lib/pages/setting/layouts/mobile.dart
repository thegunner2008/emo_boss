import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/router/router.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/extensions/extensions.dart';
import 'package:emo_boss/pages/setting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingMobile extends StatelessWidget {
  const SettingMobile({Key? key}) : super(key: key);

  User get user => UserStore.to.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColor,
      ),
      body: ColoredBox(
        color: AppColor.grey300WithOpacity500,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.sm),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: Insets.xs,
                  left: Insets.med,
                  top: Insets.med,
                  bottom: Insets.sm,
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.scaleSize,
                          backgroundColor: AppColor.primaryColor,
                          child: Text(
                            user.fullName.substring(0, 1).toUpperCase(),
                            style: TextStyle(fontSize: 32.scaleSize, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: Insets.med),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName,
                              style: TextStyle(fontSize: 18.scaleSize, color: AppColor.black800),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 16.scaleSize,
                                color: AppColor.grey300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Loading.openAndDismissLoading(
                          () => UserStore.to
                              .onLogout()
                              .whenComplete(() => context.go(ScreenRouter.signUp.path)),
                        );
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppColor.primaryColor,
                        size: IconSizes.med,
                      ),
                    )
                  ],
                ),
              ),
              SettingTitleWidget(title: "Thông tin".toUpperCase(), icon: Icons.newspaper),
              const VersionWidget(),
              VSpace(Insets.med),
            ],
          ),
        ),
      ),
    );
  }
}
