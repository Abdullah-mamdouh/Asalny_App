
import 'package:hive_flutter/hive_flutter.dart';

import 'package:chat_gpt_groups/features/chat/data/models/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_chat_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class LocalChatModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  ChatModel? chatMessages;

  LocalChatModel(@required this.name, {this.chatMessages = null});

  factory LocalChatModel.fromJson(Map<String, dynamic> json) =>
      _$LocalChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalChatModelToJson(this);

}