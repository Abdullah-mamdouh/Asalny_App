// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelsModel _$ModelsModelFromJson(Map<String, dynamic> json) => ModelsModel(
      id: json['id'] as String,
      owned_by: json['owned_by'] as String,
      created: json['created'] as int,
    );

Map<String, dynamic> _$ModelsModelToJson(ModelsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'owned_by': instance.owned_by,
    };
