import 'package:emo_boss/common/store/store.dart';

import 'type_defined.dart';

List<WebDataTableColumn<T>> getListColumnForScreenWith<T>(List<WebDataTableColumn<T>> listColumn) =>
    listColumn
        .where(
          (column) =>
              column.showOnScreens == null ||
              column.showOnScreens!.contains(ConfigStore.to.screenWidth),
        )
        .toList();
