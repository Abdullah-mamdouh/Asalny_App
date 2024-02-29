


import 'dart:math';

import 'package:chat_gpt_groups/features/chat/data/models/models_model.dart';
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_data_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chat_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatDataRepo})
      : super(const ChatState.initial());

  ChatDataRepo chatDataRepo;

  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  static List<ModelsModel> models = [];
  static List<ChatModel> chatList = [];

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(message: Message(content: msg), index: 1));
  }

  emitChatModelsStates() async {
    // emit(const ChatState.loading());
    // if(await internetChecker.isConnected){
    final response = await chatDataRepo.getModels();
    response.when(
        success: (response) {
          emit(ChatState.success(response));
          models = response;
          //userLocalRepo.cacheChat(response);
        }, failure: (error) {
      emit(ChatState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //
    // }
  }

  emitSendMessageStates(UserMessage message) async {
    //print('oooooooooooooooooooooooooooooooooooooooooooo');
    // emit(const ChatState.loading());
    emit(const ChatState.loading());
    // if(await internetChecker.isConnected){
    final response = await chatDataRepo.sendMessageGPT(message);
    response.when(
        success: (response) {
          emit(ChatState.success(response));
          //debugPrint(response.toString()+"dsavvvvvvvvvvvvvvvvvvvvvvvvvv");
          chatList.addAll(response.messages);
          //debugPrint(chatList.toString()+"dsavvvvvvvvvvvvvvvvvvvvvvvvvv");
          // models = response;
          //userLocalRepo.cacheChat(response);
        }, failure: (error) {
      emit(ChatState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //
    // }
  }

  
}