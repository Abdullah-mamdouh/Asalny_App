
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final Message message;
  int index;

  ChatModel({required this. message, required this.index});
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
