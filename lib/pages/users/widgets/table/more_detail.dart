part of 'table.dart';

class MoreDetailWidget extends StatefulWidget {
  const MoreDetailWidget(
    this.user, {
    Key? key,
  }) : super(key: key);

  final UserPlus user;

  @override
  MoreDetailWidgetState createState() => MoreDetailWidgetState();
}

class MoreDetailWidgetState extends State<MoreDetailWidget> {
  UserController get _controller => Get.find<UserController>();

  int get userId => widget.user.id;

  UserPlus? user;

  @override
  void initState() {
    super.initState();
    _controller.getUser(userId).then((value) => setState(() => user = value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey300,
      padding: EdgeInsets.all(6.scaleSize),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColor.white,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 120.scaleSize,
            maxHeight: 220.scaleSize,
          ),
          child: user != null ? _details(context, user!) : _loading(),
        ),
      ),
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _details(BuildContext context, UserPlus user) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text("Tiền đã làm", style: TextStyles.title2),
                  title: Text(
                    user.userJobs.map((e) => e.job?.money ?? 0).sum.toCurrencyStr,
                    style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                  ),
                  dense: true,
                ),
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text(
                    "Tiền đã rút",
                    style: TextStyles.title2,
                  ),
                  title: Text(
                    user.withdraws.map((e) => e.money).sum.toCurrencyStr,
                    style: TextStyles.title2.copyWith(color: AppColor.secondaryColor),
                  ),
                  dense: true,
                ),
              ),
            ],
          ),
          Divider(indent: Insets.lg, endIndent: Insets.lg),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
              minLeadingWidth: 150.scaleSize,
              leading: Text("Nhiệm vụ hiện tại", style: TextStyles.title2),
              title: Text(
                user.current?.job?.baseUrl ?? "Không có",
                style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
            ),
          ),

          // Divider(indent: Insets.lg, endIndent: Insets.lg),
          // ListTile(
          //   contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
          //   minLeadingWidth: 150.scaleSize,
          //   leading: Text(S.current.Ghi_chu, style: TextStyles.title2),
          //   title: Text(
          //     user.description,
          //     style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          //   dense: true,
          // ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       CustomButton.fullColor(
          //         text: S.current.Chinh_sua,
          //         background: AppColor.secondaryColor,
          //         textColor: AppColor.white,
          //         onPressed: () {},
          //       ),
          //       HSpace.med,
          //       CustomButton.fullColor(
          //         text: S.current.Hoan_thanh,
          //         background: AppColor.successColor,
          //         textColor: AppColor.white,
          //         onPressed: () {},
          //       ),
          //       HSpace.med,
          //     ],
          //   ),
          // ),
          const Spacer(),
        ],
      );
}
