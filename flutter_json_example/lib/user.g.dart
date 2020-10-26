// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      name: json['name'] as String,
      email: json['email'] as String,
      createdTime: json['created_Time'] as int,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'created_Time': instance.createdTime,
      'address': instance.address?.toJson()
    };
