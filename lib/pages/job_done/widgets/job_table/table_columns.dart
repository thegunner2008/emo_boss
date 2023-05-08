part of "table.dart";

final _tableColumns = [
  WebDataTableColumn<Job>(
    flex: 5,
    key: JobColumnConstants.name,
    name: "Tên web",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(rowData.baseUrl);
    },
  ),
  WebDataTableColumn<Job>(
    flex: 3,
    key: JobColumnConstants.count,
    name: S.current.So_luong,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = "${rowData.count}/${rowData.total}";
      return _textWrapper(value, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<Job>(
    flex: 3,
    key: JobColumnConstants.value,
    name: S.current.Gia_tri,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      final value = rowData.money;
      return _textWrapper(value.toCurrencyStr, alignment: Alignment.center);
    },
  ),
  WebDataTableColumn<Job>(
    flex: 3,
    key: JobColumnConstants.createdDate,
    name: S.current.Ngay_tao,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.createdAt?.fullDateAndTimeStr ?? "",
      );
    },
  ),
  WebDataTableColumn<Job>(
    flex: 3,
    key: JobColumnConstants.expiredDate,
    name: S.current.Ngay_sua,
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.updatedAt?.fullDateAndTimeStr ?? "",
        alignment: Alignment.center,
      );
    },
  ),
  WebDataTableColumn<Job>(
    flex: 3,
    key: JobColumnConstants.status,
    name: "Trạng thái",
    customizeItemWidget: (value, rowData, columnKey, columnName, width, showOnScreens) {
      return _textWrapper(
        rowData.total - rowData.count > 0 ? "Process" : "Done",
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
