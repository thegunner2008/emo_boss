// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJob _$UserJobFromJson(Map<String, dynamic> json) => UserJob(
      id: json['id'] as int? ?? -1,
      userId: json['user_id'] as int? ?? -1,
      jobId: json['job_id'] as int? ?? -1,
      job: json['job'] == null
          ? null
          : Job.fromJson(json['job'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserJobToJson(UserJob instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'job_id': instance.jobId,
      'job': instance.job,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
