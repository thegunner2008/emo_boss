
import 'dart:convert';

import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdraw.g.dart';

enum WithdrawStatus {
  @JsonValue('requested')
  requested,
  @JsonValue('transferred')
  transferred;

  String getTitle() {
    switch (this) {
      case WithdrawStatus.requested:
        return S.current.Dang_cho;
      case WithdrawStatus.transferred:
        return S.current.Hoan_thanh;
    }
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Withdraw {
  final String description;
  final String reply;
  final String urlClue;
  final String imageClue;
  final int money;
  final String withdrawMethod;
  final String bankName;
  final String numberAccount;
  final String accountName;
  final WithdrawStatus? status;
  final int userId;
  final User user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Withdraw({
    this.description = "",
    this.reply = "",
    this.urlClue = "",
    this.imageClue = "",
    this.money = 0,
    this.withdrawMethod = "",
    this.bankName = "",
    this.numberAccount = "",
    this.accountName = "",
    this.status = WithdrawStatus.requested,
    this.userId = 0,
    this.user = const User(),
    this.createdAt,
    this.updatedAt,
  });

  factory Withdraw.fromJson(Map<String, dynamic> json) => _$WithdrawFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawToJson(this);

  @override
  String toString() => jsonEncode(this).toString();

}