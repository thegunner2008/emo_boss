// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdraw _$WithdrawFromJson(Map<String, dynamic> json) => Withdraw(
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      reply: json['reply'] as String? ?? "",
      urlClue: json['url_clue'] as String? ?? "",
      imageClue: json['image_clue'] as String? ?? "",
      money: json['money'] as int? ?? 0,
      withdrawMethod: json['withdraw_method'] as String? ?? "",
      bankKey: json['bank_key'] as int? ?? 0,
      numberAccount: json['number_account'] as String? ?? "",
      accountName: json['account_name'] as String? ?? "",
      status: $enumDecodeNullable(_$WithdrawStatusEnumMap, json['status']) ??
          WithdrawStatus.requested,
      userId: json['user_id'] as int? ?? 0,
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WithdrawToJson(Withdraw instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'reply': instance.reply,
      'url_clue': instance.urlClue,
      'image_clue': instance.imageClue,
      'money': instance.money,
      'withdraw_method': instance.withdrawMethod,
      'bank_key': instance.bankKey,
      'number_account': instance.numberAccount,
      'account_name': instance.accountName,
      'status': _$WithdrawStatusEnumMap[instance.status],
      'user_id': instance.userId,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$WithdrawStatusEnumMap = {
  WithdrawStatus.requested: 'requested',
  WithdrawStatus.transferred: 'transferred',
};
