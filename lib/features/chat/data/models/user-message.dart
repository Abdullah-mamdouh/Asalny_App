
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user-message.g.dart';

@JsonSerializable()
class UserMessage {

  final String model;
  @JsonKey(name: 'messages')
  List<Message> message;
  UserMessage({required this.message, required this.model});

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);
  Map<String, dynamic> toJson() => _$UserMessageToJson(this);
}

@JsonSerializable()
class Message {
  final String role;
  final String content;

  Message({this.role = 'user', required this.content});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

}