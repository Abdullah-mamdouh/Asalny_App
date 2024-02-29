import 'package:chat_gpt_groups/networking/error_handler_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ServiceResult<T> with _$ServiceResult<T> {
  const factory ServiceResult.success(T data) = Success<T>;
  const factory ServiceResult.failure(Handler errorHandler) = Failure<T>;
}

