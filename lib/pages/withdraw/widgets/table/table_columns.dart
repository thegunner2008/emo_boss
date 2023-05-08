part of "table.dart";

final _tableColumns = [
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.name,
    name: "User",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(rowData.user.userName);
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.count,
    name: "Số tiền",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = "${rowData.money.toCurrencyStr}đ";
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 5,
    key: JobColumnConstants.value,
    name: "Tài khoản",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = "${rowData.accountName} - ${rowData.bankName} - ${rowData.numberAccount}";
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.createdDate,
    name: S.current.Ngay_tao,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.createdAt?.fullDateAndTimeStr ?? "",
      );
    },
  ),
  // WebDataTableColumn<Withdraw>(
  //   flex: 3,
  //   key: JobColumnConstants.expiredDate,
  //   name: S.current.Ngay_sua,
  //   customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
  //     return _textWrapper(
  //       rowData.updatedAt?.fullDateAndTimeStr ?? "",
  //       alignment: Alignment.center,
  //     );
  //   },
  // ),
  WebDataTableColumn<Withdraw>(
    flex: 3,
    key: JobColumnConstants.status,
    name: "Trạng thái",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.status?.name ?? "",
        alignment: Alignment.center,
      );
    },
  ),
];

Widget _textWrapper(String text, {Alignment alignment = Alignment.centerLeft}) => Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: AppColor.grey300, width: 1)),
      ),
      alignment: alignment,
      padding: EdgeInsets.all(Insets.sm),
      child: Text(text, style: TextStyles.body1.copyWith(color: AppColor.black800)),
    );
