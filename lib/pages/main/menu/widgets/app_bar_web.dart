import 'dart:math';

import 'package:collection/collection.dart';
import 'package:emo_boss/common/router/router.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controller.dart';
import '../controller.dart';
import '../menu_model.dart';

class AppBarWebWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWebWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarWebWidget> createState() => _AppBarWebWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWebWidgetState extends State<AppBarWebWidget> {
  final MainController _mainController = MainController.to;
  final MenuXController _menuController = MenuXController.to;
  bool isSelectedHeader = false;

  void setIsSelectedHeader(bool isSelectedHeader) {
    setState(() {
      this.isSelectedHeader = isSelectedHeader;
    });
  }

  Widget _menuItem(
    BuildContext context, {
    required MenuModel menuModel,
    required Color textColor,
    required bool haveChild,
    bool isSelected = false,
    int index = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: Insets.med),
      child: haveChild
          ? _menuItemWithChild(
              context,
              menuModel: menuModel,
              isSelected: isSelected,
              menuModels: menuModel.children,
              textColor: textColor,
              index: index,
            )
          : _singleMenuItem(
              context,
              menuModel: menuModel,
              isSelected: isSelected,
              textColor: textColor,
            ),
    );
  }

  Widget _menuItemWithChild(
    BuildContext context, {
    required MenuModel menuModel,
    required bool isSelected,
    required List<MenuModel> menuModels,
    required Color textColor,
    required int index,
  }) {
    final isOnlyIcon = menuModel.title == '';
    final countRow = min(menuModels.length, 3);
    final countColumn = (menuModels.length / countRow).ceil();
    final width = (countRow * 120.scaleSize);
    final height = (countColumn * 124.scaleSize);
    return PopupMenuButton<dynamic>(
      color: AppColor.white,
      surfaceTintColor: AppColor.blueLight,
      shadowColor: Colors.transparent,
      constraints: BoxConstraints.expand(width: width, height: height),
      position: PopupMenuPosition.under,
      shape: const RoundedRectangleBorder(
          borderRadius: Corners.smBorder, side: BorderSide(color: AppColor.grey600)),
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 56.scaleSize,
        child: isOnlyIcon
            ? Icon(
                menuModel.icon,
                color: textColor,
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(menuModel.icon, color: textColor),
                  HSpace.sm,
                  Text(
                    menuModel.title,
                    style:
                        TextStyles.title1.copyWith(fontWeight: FontWeight.normal, color: textColor),
                  ),
                  HSpace.sm,
                  Icon(Icons.arrow_drop_down, color: textColor)
                ],
              ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: Container(
            color: AppColor.white,
            child: GridView.count(
              padding: EdgeInsets.symmetric(vertical: Insets.xs, horizontal: Insets.med),
              shrinkWrap: true,
              crossAxisSpacing: Insets.xs,
              mainAxisSpacing: 5,
              crossAxisCount: countRow,
              children: menuModels.map(
                (e) {
                  bool isSelected = _mainController.state.currentPage == e.screenRouter;
                  Color colorDisPlay = isSelected ? AppColor.primaryColor : AppColor.secondaryText;
                  return CustomButton.customOutline(
                    padding: EdgeInsets.all(Insets.xs),
                    borderColor: AppColor.white,
                    shadowColor: AppColor.grey100,
                    onPressed: () {
                      if (e.screenRouter?.title == '') return;
                      context.popNavigator();
                      _menuController.handleClickMenu(e, context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          e.icon,
                          color: colorDisPlay,
                        ),
                        VSpace(2.scaleSize),
                        Flexible(
                          child: Text(
                            e.title,
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: TextStyles.title1.copyWith(
                                fontSize: FontSizes.s14,
                                fontWeight: FontWeight.normal,
                                color: colorDisPlay),
                          ),
                        ),
                        VSpace.xs,
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _singleMenuItem(
    BuildContext context, {
    required MenuModel menuModel,
    required bool isSelected,
    required Color textColor,
  }) {
    return InkWell(
      key: Key(AppKey.$appBarWebKey(menuModel.key)),
      onTap: () {
        setIsSelectedHeader(false);
        _menuController.handleClickMenu(menuModel, context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            menuModel.icon,
            size: IconSizes.med,
            color: textColor,
          ),
          HSpace.sm,
          Text(
            menuModel.title,
            style: TextStyles.title1.copyWith(
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _menuHeaderWeb(BuildContext context) {
    return CustomButton.customFullColor(
      padding: EdgeInsets.zero,
      background: AppColor.white,
      onPressed: () {
        setIsSelectedHeader(true);
        CustomDialog.defaultDialog(
          context,
          borderRadius: Corners.custom25Border,
          barrierColor: Colors.transparent,
          insetsPadding: EdgeInsets.symmetric(vertical: 70.scaleSize, horizontal: 30.scaleSize),
          alignment: Alignment.topRight,
          content: Container(
            padding: EdgeInsets.symmetric(vertical: Insets.med, horizontal: Insets.sm),
            decoration: BoxDecoration(
                color: AppColor.grey100,
                borderRadius: Corners.custom25Border,
                border: Border.all(color: AppColor.grey600)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(Insets.med),
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: Corners.custom25Border,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(65.scaleSize),
                            child: Container(
                              color: AppColor.white,
                              height: 65.scaleSize,
                              width: 65.scaleSize,
                              child: Image.asset(
                                AppImages.appIcon,
                                width: 60.scaleSize,
                              ),
                            ),
                          ),
                          HSpace.sm,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quản lý EMO",
                                  style: TextStyles.title1,
                                ),
                                Text(
                                  UserStore.to.user.userName,
                                  style: TextStyles.input1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      VSpace.sm,
                    ],
                  ),
                ),
                VSpace.sm,
                CustomButton.customOutline(
                  background: AppColor.grey100,
                  borderColor: AppColor.grey100,
                  shadowColor: AppColor.white,
                  onPressed: () => UserStore.to
                    ..onLogout().whenComplete(() => context.go(ScreenRouter.signUp.path)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: AppColor.black800,
                      ),
                      HSpace.sm,
                      Text(
                        "Đăng xuất",
                        style: TextStyles.title1.copyWith(
                          color: AppColor.black800,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelectedHeader ? AppColor.primaryColor : AppColor.white,
                width: 2.scaleSize),
            borderRadius: BorderRadius.all(Radius.circular(50.scaleSize))),
        height: 50.scaleSize,
        width: 50.scaleSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.scaleSize),
          child: Image.asset(
            AppImages.appIcon,
            width: 60.scaleSize,
          ),
        ),
      ),
    );
  }

  Widget customMenuItem(int index, MenuModel item) {
    final ScreenRouter currentPage = _mainController.state.currentPage;
    final MenuModel menuModel = item;
    final bool haveChild = menuModel.children.isNotEmpty;
    bool isSelected = haveChild
        ? menuModel.children.any((item) => item.screenRouter == currentPage)
        : currentPage == menuModel.screenRouter;
    final Color textColor = isSelected ? AppColor.primaryColor : AppColor.secondaryText;
    return Visibility(
      visible: menuModel.isVisible,
      child: _menuItem(
        context,
        textColor: textColor,
        haveChild: haveChild,
        menuModel: menuModel,
        isSelected: isSelected,
        index: index,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.scaleSize,
      padding: EdgeInsets.symmetric(
        horizontal: Insets.lg,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: Shadows.universal,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Text("EMO", style: TextStyles.h2),
            onTap: () => context.goNamed(ScreenRouter.main.name),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(
                    () {
                      final menuModels = _menuController.menuModels
                          .where((element) => element.menuStyle != MenuStyleView.right);
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: menuModels.mapIndexed(customMenuItem).toList(),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _menuController.menuModels
                          .where((element) => element.menuStyle == MenuStyleView.right)
                          .map((item) => customMenuItem(0, item))
                          .toList(),
                    ),
                    HSpace.sm,
                    _menuHeaderWeb(context),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
