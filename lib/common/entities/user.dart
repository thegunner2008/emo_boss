import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String email;
  final String userName;
  final String password;
  final String fullName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastLogin;

  const User({
    this.id = -1,
    this.email = "",
    this.userName = "",
    this.password = "",
    this.fullName = "",
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => jsonEncode(this).toString();
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserTotal extends User {
  final Current? current;
  final int total;
  final int countTransaction;
  final int countJob;
  final int withdrawTotal;
  final int withdrawCount;

  const UserTotal({
    int id = -1,
    String email = "",
    String userName = "",
    String password = "",
    String fullName = "",
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLogin,
    this.current,
    this.total = 0,
    this.countTransaction = 0,
    this.countJob = 0,
    this.withdrawTotal = 0,
    this.withdrawCount = 0,
  }) : super(
          id: id,
          email: email,
          userName: userName,
          password: password,
          fullName: fullName,
          createdAt: createdAt,
          updatedAt: updatedAt,
          lastLogin: lastLogin,
        );

  factory UserTotal.fromJson(Map<String, dynamic> json) => _$UserTotalFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserTotalToJson(this);

  @override
  String toString() => jsonEncode(this).toString();
}

@JsonSerializable()
class LoginResponse {
  final String accessToken;

  const LoginResponse({
    this.accessToken = '',
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class SignUpResponse {
  final String fullName;
  final String email;
  final bool isActive;
  final DateTime? lastLogin;

  const SignUpResponse({
    this.fullName = '',
    this.email = '',
    this.isActive = false,
    this.lastLogin,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
