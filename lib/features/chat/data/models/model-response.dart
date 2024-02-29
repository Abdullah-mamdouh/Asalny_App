
import 'package:chat_gpt_groups/features/chat/data/models/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'model-response.g.dart';

@JsonSerializable()
class ModelResponse {
  @JsonKey(name: 'choices')
  final List<ChatModel> messages;
  ModelResponse(this.messages);

  factory ModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ModelResponseToJson(this);
}