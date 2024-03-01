
import 'package:chat_gpt_groups/features/chat/data/models/local_chat_model.dart';
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:hive/hive.dart';

import '../../../../../networking/api_service/api_result.dart';
import '../../../../../networking/error_handler_base.dart';
import '../../models/chat_model.dart';

class LocalChatRepo {
  LocalChatRepo({required Box<LocalChatModel?> chatsBox}) : _chatsBox = chatsBox;

  final Box<LocalChatModel?> _chatsBox;
  late final Box<ChatModel> chatsBox;

  Future<void> addChat({required String chatName}) async{
    await _chatsBox.add(LocalChatModel(chatName));
  }

  // Future<void> saveChatsLocally({
  //   required List<LocalChatModel> chats,
  // }) async {
  //   for (final chat in chats) {
  //     //await _chatsBox.put(chat.id, chat);
  //   }
  // }
  Future<ServiceResult<List<LocalChatModel?>>> fetchAllLocalChats() async {

    try{
      final localChats = await _chatsBox.values.toList();
      for(int i =0;i< localChats.length; i++){
        print(localChats[i]!.toJson().toString()+"ggggggggggggggggggggggggggggggg");
      }

      return ServiceResult.success(localChats);
    } catch (errro) {
      print("sfdadsssssssssssssssssssssssssss");
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }

  Future<ServiceResult<List<ChatModel>>> fetchLocalChatMessages(String chatName) async {
   openBox(chatName);
    try{
      final chatDetails = await chatsBox.values.toList();

      return ServiceResult.success(chatDetails);
    } catch (errro) {
      print("sfdadsssssssssssssssssssssssssss");
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }

  openBox(String chatName) async{
    if(!(Hive.isBoxOpen(chatName))){
      Hive.registerAdapter(ChatModelAdapter());
      Hive.registerAdapter(MessageAdapter());
      chatsBox = await Hive.openBox<ChatModel>(chatName);

    }
  }

  Future<void> addMessage({required String chatName,required ChatModel message}) async{
    openBox(chatName);
    await chatsBox.add(message);
  }

}

