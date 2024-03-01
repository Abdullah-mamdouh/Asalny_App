
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'chat_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class ChatModel {

  @HiveField(0)
  int index;

  @HiveField(1)
  Message message;


  ChatModel({required this. message, required this.index});
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
