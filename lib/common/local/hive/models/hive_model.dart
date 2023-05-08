import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/utils/utils.dart';

import 'models.dart';

abstract class HiveModel<T> {
  T get hiveKey;

  AggregateRoot toEntity();

  static HiveModel fromEntity(AggregateRoot entity) {
    try {
      return _mapper[entity.runtimeType]!(entity);
    } catch (e) {
      throw Exception("No mapper for type ${entity.runtimeType}");
    }
  }
}

final _mapper = <Type, ValueGetterWithInput<AggregateRoot, HiveModel>>{
  // Product: (entity) => ProductHiveModel.fromEntity(entity as Product),
};
