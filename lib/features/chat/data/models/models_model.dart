
import 'package:freezed_annotation/freezed_annotation.dart';
part 'models_model.g.dart';

@JsonSerializable()
class ModelsModel {
  final String id;
  final int created;
  final String owned_by;

  ModelsModel({
    required this.id,
    required this.owned_by,
    required this.created,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) =>
      _$ModelsModelFromJson(json);
}
