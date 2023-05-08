// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      id: json['id'] as int? ?? -1,
      userId: json['user_id'] as int? ?? -1,
      jobId: json['job_id'] as int? ?? -1,
      job: json['job'] == null
          ? null
          : Job.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'job_id': instance.jobId,
      'job': instance.job,
    };
