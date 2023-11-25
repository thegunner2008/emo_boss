part of "table.dart";

final _tableColumns = [
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.name,
    name: "User",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        Text(rowData.user.userName, style: TextStyles.body1.copyWith(color: AppColor.black800)),
      );
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.count,
    name: "Số tiền",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = "${rowData.money.toCurrencyStr}đ";
      return _textWrapper(
        Text(value, style: TextStyles.body1.copyWith(color: AppColor.black800)),
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 5,
    key: JobColumnConstants.value,
    name: "Tài khoản",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value =
          "${rowData.accountName} - ${rowData.bankShortName} - ${rowData.numberAccount}";
      return _textWrapper(
        Text(value, style: TextStyles.body1.copyWith(color: AppColor.black800)),
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.createdDate,
    name: S.current.Ngay_tao,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        Text(
          rowData.createdAt?.fullDateAndTimeStr ?? "",
          style: TextStyles.body1.copyWith(color: AppColor.black800),
        ),
      );
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.status,
    name: "Trạng thái",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        Text(
          rowData.status?.getTitle() ?? "",
          style: TextStyles.body1.copyWith(
            fontStyle: FontStyle.italic,
            color: rowData.status == WithdrawStatus.transferred
                ? AppColor.successColor
                : AppColor.orange,
          ),
        ),
        alignment: Alignment.center,
      );
    },
  ),
];

Widget _textWrapper(Widget widget, {Alignment alignment = Alignment.centerLeft}) => Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: AppColor.grey300, width: 1)),
      ),
      alignment: alignment,
      padding: EdgeInsets.all(Insets.sm),
      child: widget,
    );
