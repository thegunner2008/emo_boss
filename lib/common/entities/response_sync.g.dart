// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_sync.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseList<T> _$ResponseListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseList<T>(
      json['code'] as String,
      json['message'] as String,
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseListToJson<T>(
  ResponseList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data.map(toJsonT).toList(),
      'metadata': instance.metadata,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      json['current_page'] as int,
      json['page_size'] as int,
      json['total_items'] as int,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'total_items': instance.totalItems,
    };
