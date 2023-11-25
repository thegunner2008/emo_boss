part of "table.dart";

final _tableColumns = [
  WebDataTableColumn<UserTotal>(
    flex: 2,
    key: UserColumnConstants.name,
    name: "User",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(rowData.userName);
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 3,
    key: UserColumnConstants.fullName,
    name: "Tên",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = rowData.fullName;
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 3,
    key: UserColumnConstants.email,
    name: "Email",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = rowData.email;
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 3,
    key: UserColumnConstants.createdDate,
    name: S.current.Ngay_tao,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.createdAt?.fullDateAndTimeStr ?? "",
      );
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 3,
    key: UserColumnConstants.lastLogin,
    name: "Đăng nhập",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.lastLogin?.fullDateAndTimeStr ?? "",
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 2,
    key: UserColumnConstants.countTransactions,
    name: "Số nhiệm vụ",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.countTransaction.toCurrencyStr,
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<UserTotal>(
    flex: 2,
    key: UserColumnConstants.countJob,
    name: "Số lần làm",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.countJob.toCurrencyStr,
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
