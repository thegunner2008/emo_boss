import 'package:emo_boss/common/entities/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Current {
  final int id;
  final int userId;
  final int jobId;
  final Job? job;

  Current({
    this.id = -1,
    this.userId = -1,
    this.jobId = -1,
    this.job,
  });

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}