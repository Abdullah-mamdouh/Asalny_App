
import 'package:chat_gpt_groups/features/chat/data/models/local_chat_model.dart';
import 'package:hive/hive.dart';

class ChatsRepository {
  ChatsRepository({required Box<LocalChatModel?> chatsBox}) : _chatsBox = chatsBox;

  final Box<LocalChatModel?> _chatsBox;

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

  Future<List<LocalChatModel?>> fetchAllLocalChats() async {
    final localChats = _chatsBox.values.toList();
    return localChats;
  }
}

