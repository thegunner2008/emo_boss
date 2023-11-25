import 'package:emo_boss/common/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Transaction {
  final int id;
  final int userId;
  final int jobId;
  final Job? job;
  final int money;
  final String ip;
  final String deviceId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Transaction({
    this.id = -1,
    this.userId = -1,
    this.jobId = -1,
    this.job,
    this.money = 0,
    this.ip = "",
    this.deviceId = "",
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
