part of 'table.dart';

class MoreDetailWidget extends StatelessWidget {
  const MoreDetailWidget(
    this.withdraw, {
    Key? key,
  }) : super(key: key);

  WithdrawController get _controller => WithdrawController.to;

  final Withdraw withdraw;

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
          child: Column(
            children: [
              VSpace.sm,
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: _details(context)),
                    if(withdraw.status != WithdrawStatus.transferred) _qrWidget(),
                    HSpace.sm,
                  ],
                ),
              ),
              Flexible(child: _footer()),
            ],
          ),
          // MoreDetailRoomTransactionHistory(voucher: job),
        ),
      ),
    );
  }

  Widget _details(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text(S.current.Phuong_thuc, style: TextStyles.title2),
                  title: Text(
                    withdraw.withdrawMethod,
                    style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                  ),
                  dense: true,
                ),
              ),
              if (withdraw.bankKey != 0)
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                    minLeadingWidth: 150.scaleSize,
                    leading: Text(
                      "Ngân hàng",
                      style: TextStyles.title2,
                    ),
                    title: Text(
                      withdraw.bankShortName,
                      style: TextStyles.title2.copyWith(color: AppColor.secondaryColor),
                    ),
                    dense: true,
                  ),
                ),
            ],
          ),
          Divider(indent: Insets.lg, endIndent: Insets.lg),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text("Tài khoản", style: TextStyles.title2),
                  title: Text(
                    withdraw.accountName,
                    style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  dense: true,
                ),
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text("Số tài khoản", style: TextStyles.title2),
                  title: SelectableText(
                    withdraw.numberAccount,
                    style: TextStyles.title2.copyWith(
                      decoration: TextDecoration.underline, // Add underline to the link
                      color: AppColor.primaryColor, // Set the color of the link to green
                    ),
                  ),
                  dense: true,
                ),
              ),
            ],
          ),
          Divider(indent: Insets.lg, endIndent: Insets.lg),
          const Spacer(),
        ],
      );

  Widget _qrWidget() => FutureBuilder(
        future: _controller.getQrPayImage(withdraw: withdraw, size: 120),
        builder: (ctx, snapshot) => RawImage(
          image: snapshot.data as ui.Image,
          fit: BoxFit.cover,
        ),
      );

  Widget _footer() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
              minLeadingWidth: 150.scaleSize,
              leading: Text(S.current.Ghi_chu,
                  style: TextStyles.title2.copyWith(fontStyle: FontStyle.italic)),
              title: Text(
                withdraw.description,
                style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
            ),
          ),
          withdraw.status == WithdrawStatus.transferred ?
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                minLeadingWidth: 150.scaleSize,
                leading: Text("ND chuyển khoản",
                    style: TextStyles.title2.copyWith(fontStyle: FontStyle.italic)),
                title: Text(
                  withdraw.reply,
                  style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                dense: true,
              ),
            )
          : Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton.fullColor(
                  text: S.current.Chinh_sua,
                  background: AppColor.secondaryColor,
                  textColor: AppColor.white,
                  onPressed: () {},
                ),
                HSpace.med,
                CustomButton.fullColor(
                  text: S.current.Hoan_thanh,
                  background: AppColor.primaryColor,
                  textColor: AppColor.white,
                  onPressed: () => _controller.pay(withdraw: withdraw),
                ),
                if(withdraw.status == WithdrawStatus.transferred)

                  HSpace.med,
              ],
            ),
          ),
        ],
      );
}
