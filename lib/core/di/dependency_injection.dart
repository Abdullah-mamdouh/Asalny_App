
import 'package:chat_gpt_groups/features/chat/data/models/chat_model.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_api_repo.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_data_repo.dart';
import 'package:chat_gpt_groups/features/chat/logic/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:chat_gpt_groups/features/chat/data/models/local_chat_model.dart';
import 'package:hive/hive.dart';

import '../../features/chat/data/models/user-message.dart';
import '../../features/chat/data/repo/local_chat_repo/local_chat_repo.dart';

import '../../networking/api_service/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  //key
  const chatsKey = 'chats';
  //adapters
  Hive.registerAdapter(LocalChatModelAdapter());
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(MessageAdapter());
  //box
  final chatsBox = await Hive.openBox<LocalChatModel?>(chatsKey);
  //repos
  LocalChatRepo(chatsBox: chatsBox);

  /// Dio
  Dio dio = DioFactory.getDio();

  /// chat repo
  getIt.registerLazySingleton(() => ChatApiRepo(dio));
  getIt.registerLazySingleton(() => ChatDataRepo(chatApiRepo: getIt()));
  getIt.registerLazySingleton(() => LocalChatRepo(chatsBox: chatsBox));

  /// chat cubit
  getIt.registerFactory(() => ChatCubit(chatDataRepo: getIt(),localChatRepo: getIt()));
}
