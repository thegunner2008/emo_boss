import 'package:emo_boss/common/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'job.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResponseJob {
  String code;
  String message;
  int totalMoney;
  int totalWithdraw;
  List<MapJob> data;
  Metadata metadata;

  ResponseJob(
      this.code, this.message, this.totalMoney, this.totalWithdraw, this.data, this.metadata);

  factory ResponseJob.fromJson(Map<String, dynamic> json) => _$ResponseJobFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseJobToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MapJob {
  @JsonKey(name: 'Job')
  Job job;
  DateTime createdAt;

  MapJob(this.job, this.createdAt);

  factory MapJob.fromJson(Map<String, dynamic> json) => _$MapJobFromJson(json);

  Map<String, dynamic> toJson() => _$MapJobToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Job {
  final int id;
  final String keyWord;
  final String image;
  final int total;
  final int count;
  final String url;
  final String keyPage;
  final String valuePage;
  final int time;
  final String baseUrl;
  @JsonKey(readValue: ValueReader.intMaybeString)
  final int money;
  DateTime? createdAt;
  DateTime? updatedAt;

  // final List<UserJob> users;
  // final Current current;

  Job({
    this.id = -1,
    this.keyWord = "",
    this.image = "",
    this.total = 0,
    this.count = 0,
    this.url = "",
    this.keyPage = "",
    this.valuePage = "",
    this.time = 0,
    this.baseUrl = "",
    this.money = 0,
    this.createdAt,
    this.updatedAt,
    // this.users = const [],
    // this.current = const Current(),
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);

  Job copyWith({
    int? id,
    String? keyWord,
    String? image,
    int? total,
    int? count,
    String? url,
    String? keyPage,
    String? valuePage,
    int? time,
    String? baseUrl,
    int? money,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Job(
        id: id ?? this.id,
        keyWord: keyWord ?? this.keyWord,
        image: image ?? this.image,
        total: total ?? this.total,
        count: count ?? this.count,
        url: url ?? this.url,
        keyPage: keyPage ?? this.keyPage,
        valuePage: valuePage ?? this.valuePage,
        time: time ?? this.time,
        baseUrl: baseUrl ?? this.baseUrl,
        money: money ?? this.money,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  static Job cloneInstance(Job job) {
    return Job.fromJson(job.toJson());
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentJobResponse {
  final int currentId;
  final Job? job;

  const CurrentJobResponse({
    this.currentId = -1,
    this.job,
  });

  factory CurrentJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentJobResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StartJobResponse {
  final String token;
  final String key;

  const StartJobResponse({
    this.token = "",
    this.key = "",
  });

  factory StartJobResponse.fromJson(Map<String, dynamic> json) => _$StartJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StartJobResponseToJson(this);
}

enum JobStatus { none, start, error, done }
