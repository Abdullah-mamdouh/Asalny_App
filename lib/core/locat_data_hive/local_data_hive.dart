

import 'package:chat_gpt_groups/features/chat/data/models/local_chat_model.dart';
import 'package:hive/hive.dart';

import '../../features/chat/data/repo/local_chat_repo/local_chat_repo.dart';

class LocalDataHive {

  Future<void> initialiseHive() async {
    //key
    const chatsKey = 'chats';
    //adapters
    Hive.registerAdapter(LocalChatModelAdapter());
    //box
    final chatsBox = await Hive.openBox<LocalChatModel?>(chatsKey);
    //repos
    ChatsRepository(chatsBox: chatsBox);
  }
}