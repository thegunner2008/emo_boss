// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int? ?? -1,
      email: json['email'] as String? ?? "",
      userName: json['user_name'] as String? ?? "",
      password: json['password'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'user_name': instance.userName,
      'password': instance.password,
      'full_name': instance.fullName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
    };

UserTotal _$UserTotalFromJson(Map<String, dynamic> json) => UserTotal(
      id: json['id'] as int? ?? -1,
      email: json['email'] as String? ?? "",
      userName: json['user_name'] as String? ?? "",
      password: json['password'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      total: json['total'] as int? ?? 0,
      countTransaction: json['count_transaction'] as int? ?? 0,
      countJob: json['count_job'] as int? ?? 0,
      withdrawTotal: json['withdraw_total'] as int? ?? 0,
      withdrawCount: json['withdraw_count'] as int? ?? 0,
    );

Map<String, dynamic> _$UserTotalToJson(UserTotal instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'user_name': instance.userName,
      'password': instance.password,
      'full_name': instance.fullName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
      'current': instance.current,
      'total': instance.total,
      'count_transaction': instance.countTransaction,
      'count_job': instance.countJob,
      'withdraw_total': instance.withdrawTotal,
      'withdraw_count': instance.withdrawCount,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'isActive': instance.isActive,
      'lastLogin': instance.lastLogin?.toIso8601String(),
    };
