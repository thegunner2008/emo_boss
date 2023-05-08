// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseJob _$ResponseJobFromJson(Map<String, dynamic> json) => ResponseJob(
      json['code'] as String,
      json['message'] as String,
      json['total_money'] as int,
      json['total_withdraw'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => MapJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseJobToJson(ResponseJob instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'total_money': instance.totalMoney,
      'total_withdraw': instance.totalWithdraw,
      'data': instance.data,
      'metadata': instance.metadata,
    };

MapJob _$MapJobFromJson(Map<String, dynamic> json) => MapJob(
      Job.fromJson(json['Job'] as Map<String, dynamic>),
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MapJobToJson(MapJob instance) => <String, dynamic>{
      'Job': instance.job,
      'created_at': instance.createdAt.toIso8601String(),
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as int? ?? -1,
      keyWord: json['key_word'] as String? ?? "",
      image: json['image'] as String? ?? "",
      total: json['total'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
      url: json['url'] as String? ?? "",
      keyPage: json['key_page'] as String? ?? "",
      valuePage: json['value_page'] as String? ?? "",
      time: json['time'] as int? ?? 0,
      baseUrl: json['base_url'] as String? ?? "",
      money: ValueReader.intMaybeString(json, 'money') as int? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'key_word': instance.keyWord,
      'image': instance.image,
      'total': instance.total,
      'count': instance.count,
      'url': instance.url,
      'key_page': instance.keyPage,
      'value_page': instance.valuePage,
      'time': instance.time,
      'base_url': instance.baseUrl,
      'money': instance.money,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

CurrentJobResponse _$CurrentJobResponseFromJson(Map<String, dynamic> json) =>
    CurrentJobResponse(
      currentId: json['current_id'] as int? ?? -1,
      job: json['job'] == null
          ? null
          : Job.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentJobResponseToJson(CurrentJobResponse instance) =>
    <String, dynamic>{
      'current_id': instance.currentId,
      'job': instance.job,
    };

StartJobResponse _$StartJobResponseFromJson(Map<String, dynamic> json) =>
    StartJobResponse(
      token: json['token'] as String? ?? "",
      key: json['key'] as String? ?? "",
    );

Map<String, dynamic> _$StartJobResponseToJson(StartJobResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'key': instance.key,
    };
