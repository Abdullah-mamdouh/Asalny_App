

import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T>{
  const factory ChatState.initial() = _Initial;

  const factory ChatState.loading() = Loading;
  const factory ChatState.success(T data) = Success<T>;
  const factory ChatState.error({required String error}) = Error;
  const factory ChatState.isConnected() = IsConnected;
}