import 'package:emo_boss/common/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_job.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserJob {
  final int id;
  final int userId;
  final int jobId;
  final Job? job;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserJob({
    this.id = -1,
    this.userId = -1,
    this.jobId = -1,
    this.job,
    this.createdAt,
    this.updatedAt,
  });

  factory UserJob.fromJson(Map<String, dynamic> json) => _$UserJobFromJson(json);

  Map<String, dynamic> toJson() => _$UserJobToJson(this);
}
