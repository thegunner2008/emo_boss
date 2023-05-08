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

UserPlus _$UserPlusFromJson(Map<String, dynamic> json) => UserPlus(
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
      userJobs: (json['jobs'] as List<dynamic>?)
              ?.map((e) => UserJob.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      withdraws: (json['withdraws'] as List<dynamic>?)
              ?.map((e) => Withdraw.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserPlusToJson(UserPlus instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'user_name': instance.userName,
      'password': instance.password,
      'full_name': instance.fullName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
      'jobs': instance.userJobs,
      'current': instance.current,
      'withdraws': instance.withdraws,
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
