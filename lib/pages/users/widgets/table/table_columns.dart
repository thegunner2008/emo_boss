part of "table.dart";

final _tableColumns = [
  WebDataTableColumn<UserPlus>(
    flex: 2,
    key: JobColumnConstants.name,
    name: "User",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(rowData.userName);
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 3,
    key: JobColumnConstants.count,
    name: "Tên",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = rowData.fullName;
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 3,
    key: JobColumnConstants.value,
    name: "Email",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = rowData.email;
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 3,
    key: JobColumnConstants.createdDate,
    name: S.current.Ngay_tao,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.createdAt?.fullDateAndTimeStr ?? "",
      );
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 3,
    key: JobColumnConstants.expiredDate,
    name: "Đăng nhập",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.lastLogin?.fullDateAndTimeStr ?? "",
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 2,
    key: JobColumnConstants.status,
    name: "Số nhiệm vụ",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.totalJobsByIds.toCurrencyStr,
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<UserPlus>(
    flex: 2,
    key: JobColumnConstants.status,
    name: "Số lần làm",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.totalJobs.toCurrencyStr,
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
