
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/common/values/values.dart';
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
  final int id;
  final String description;
  final String reply;
  final String urlClue;
  final String imageClue;
  final int money;
  final String withdrawMethod;
  final int bankKey;
  final String numberAccount;
  final String accountName;
  final WithdrawStatus? status;
  final int userId;
  final User user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Withdraw({
    this.id = 0,
    this.description = "",
    this.reply = "",
    this.urlClue = "",
    this.imageClue = "",
    this.money = 0,
    this.withdrawMethod = "",
    this.bankKey = 0,
    this.numberAccount = "",
    this.accountName = "",
    this.status = WithdrawStatus.requested,
    this.userId = 0,
    this.user = const User(),
    this.createdAt,
    this.updatedAt,
  });

  Withdraw copyWith({
    int? id,
    String? description,
    String? reply,
    String? urlClue,
    String? imageClue,
    int? money,
    String? withdrawMethod,
    int? bankKey,
    String? numberAccount,
    String? accountName,
    WithdrawStatus? status,
    int? userId,
    User? user,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Withdraw(
      id: id ?? this.id,
      description: description ?? this.description,
      reply: reply ?? this.reply,
      urlClue: urlClue ?? this.urlClue,
      imageClue: imageClue ?? this.imageClue,
      money: money ?? this.money,
      withdrawMethod: withdrawMethod ?? this.withdrawMethod,
      bankKey: bankKey ?? this.bankKey,
      numberAccount: numberAccount ?? this.numberAccount,
      accountName: accountName ?? this.accountName,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get code => "E${createdAt?.timeIntDay}-$id";

  String get bankName => AppConstant.mapBankBIN[bankKey] ?? "";

  String get bankShortName => bankName.split(")").elementAtOrNull(0)?.replaceAll("(", "") ?? "";

  factory Withdraw.fromJson(Map<String, dynamic> json) => _$WithdrawFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawToJson(this);

  @override
  String toString() => jsonEncode(this).toString();

}