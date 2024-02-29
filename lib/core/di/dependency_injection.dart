
import 'package:chat_gpt_groups/features/chat/data/repo/chat_api_repo.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_data_repo.dart';
import 'package:chat_gpt_groups/features/chat/logic/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../networking/api_service/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  /// Dio
  Dio dio = DioFactory.getDio();

  /// chat repo
  getIt.registerLazySingleton(() => ChatApiRepo(dio));
  getIt.registerLazySingleton(() => ChatDataRepo(chatApiRepo: getIt()));

  /// chat cubit
  getIt.registerFactory(() => ChatCubit(chatDataRepo: getIt()));
}
