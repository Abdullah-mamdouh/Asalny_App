// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelResponse _$ModelResponseFromJson(Map<String, dynamic> json) =>
    ModelResponse(
      (json['choices'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelResponseToJson(ModelResponse instance) =>
    <String, dynamic>{
      'choices': instance.messages,
    };
