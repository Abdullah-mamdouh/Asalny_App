


import 'dart:math';

import 'package:chat_gpt_groups/features/chat/data/models/local_chat_model.dart';
import 'package:chat_gpt_groups/features/chat/data/models/models_model.dart';
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_data_repo.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/local_chat_repo/local_chat_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chat_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatDataRepo, required this.localChatRepo})
      : super(const ChatState.initial());

  ChatDataRepo chatDataRepo;
  LocalChatRepo localChatRepo;

  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  static List<ModelsModel> models = [];
  static List<ChatModel> chatList = [];
  final chatNameController = TextEditingController();

  void addUserMessage({required ChatModel msg, required String chatName}) async{
    chatList.add(msg);
    await localChatRepo.addMessage(chatName: chatName, message: msg);
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
    emit(const ChatState.loading());
    // if(await internetChecker.isConnected){
    final response = await chatDataRepo.sendMessageGPT(message);
    response.when(
        success: (response) {
          emit(ChatState.success(response));

          chatList.addAll(response.messages);
        }, failure: (error) {
      emit(ChatState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //
    // }
  }

  emitAddChatStates() async {
    print(chatNameController.text);
    await localChatRepo.addChat(chatName: chatNameController.text);
    await emitGetChatStates();
  }

  static List<LocalChatModel?> allChats = [];
  emitGetChatStates() async {
    emit(const ChatState.loading());
    // if(await internetChecker.isConnected){
    final response = await localChatRepo.fetchAllLocalChats();
    response.when(
        success: (response) {
          print(response.toList().toString());
          emit(ChatState.success(response));
          allChats = response;
        }, failure: (error) {
      emit(ChatState.error(error: error.errorModel.message ?? ''));
    });
  }

  emitGetChatMessagestates(String chatName) async {
    emit(const ChatState.loading());
    // if(await internetChecker.isConnected){
    final response = await localChatRepo.fetchLocalChatMessages(chatName);
    response.when(
        success: (response) {
          print(response.toList().toString());
          emit(ChatState.success(response));
          chatList = response;
        }, failure: (error) {
      emit(ChatState.error(error: error.errorModel.message ?? ''));
    });
  }
}