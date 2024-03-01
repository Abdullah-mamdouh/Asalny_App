// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalChatModelAdapter extends TypeAdapter<LocalChatModel> {
  @override
  final int typeId = 0;

  @override
  LocalChatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalChatModel(
      fields[0] as String,
      chatMessages: fields[1] as ChatModel?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalChatModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.chatMessages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalChatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalChatModel _$LocalChatModelFromJson(Map<String, dynamic> json) =>
    LocalChatModel(
      json['name'] as String,
      chatMessages: json['chatMessages'] == null
          ? null
          : ChatModel.fromJson(json['chatMessages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalChatModelToJson(LocalChatModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'chatMessages': instance.chatMessages,
    };
