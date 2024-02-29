// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      message: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.message,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: json['role'] as String? ?? 'user',
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
