part of 'table.dart';

class MoreDetailWidget extends StatelessWidget {
  const MoreDetailWidget(
    this.job, {
    Key? key,
  }) : super(key: key);

  final Job job;

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
          child: _details(context),
          // MoreDetailRoomTransactionHistory(voucher: job),
        ),
      ),
    );
  }

  Widget _linearProgress(int count, int total) => Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // bo tròn cạnh của LinearProgressIndicator
            child: LinearProgressIndicator(
              minHeight: 24.scaleSize,
              value: count / total,
              backgroundColor: AppColor.grey600,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Center(
            child: Text(
              "${count.toCurrencyStr}/${total.toCurrencyStr}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      );

  Widget _details(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                  minLeadingWidth: 150.scaleSize,
                  leading: Text("Từ khoá", style: TextStyles.title2),
                  title: SelectableText(
                    job.keyWord,
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
                    S.current.Hoan_thanh,
                    style: TextStyles.title2,
                  ),
                  title: _linearProgress(job.count, job.total),
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
                  leading: Text(S.current.Chi_tiet, style: TextStyles.title2),
                  title: Text(
                    "${job.money.toCurrencyStr}đ",
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
                  leading: Text(S.current.Gia_tri, style: TextStyles.title2),
                  title: SelectableText(
                    job.url,
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
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
            minLeadingWidth: 150.scaleSize,
            leading: Text("Key-Value", style: TextStyles.title2),
            title: Text(
              "${job.keyPage} - ${job.valuePage}",
              style: TextStyles.title2.copyWith(color: AppColor.primaryColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            dense: true,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton.fullColor(
                  text: S.current.Chinh_sua,
                  background: AppColor.primaryColor,
                  textColor: AppColor.white,
                  onPressed: () {},
                ),
                HSpace.med,
                CustomButton.fullColor(
                  text: S.current.Xoa,
                  background: AppColor.errorColor,
                  textColor: AppColor.white,
                  onPressed: () {},
                ),
                HSpace.med,
              ],
            ),
          ),
          const Spacer(),
        ],
      );
}
