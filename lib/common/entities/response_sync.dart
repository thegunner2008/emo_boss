import 'package:json_annotation/json_annotation.dart';

part 'response_sync.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseList<T> {
  String code;
  String message;
  List<T> data;
  Metadata metadata;

  ResponseList(this.code, this.message, this.data, this.metadata);

  factory ResponseList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object? json) fromJsonT) =>
      _$ResponseListToJson(this, fromJsonT);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Metadata {
  int currentPage;
  int pageSize;
  int totalItems;

  Metadata(this.currentPage, this.pageSize, this.totalItems);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
