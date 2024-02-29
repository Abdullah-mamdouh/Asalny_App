

import 'package:chat_gpt_groups/features/chat/data/models/model-response.dart';
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:chat_gpt_groups/features/chat/data/repo/chat_api_repo.dart';

import '../../../../networking/api_service/api_result.dart';
import '../../../../networking/error_handler_base.dart';
import '../models/chat_model.dart';
import '../models/models_model.dart';

class ChatDataRepo {
  ChatApiRepo chatApiRepo;

  ChatDataRepo({required this.chatApiRepo});


  Future<ServiceResult<ModelResponse>> sendMessageGPT(UserMessage message) async{
    try{
      final response = await chatApiRepo.sendMessageGPT(message);
      print(response.messages.toString()+"asdsjkhhhhhhhhhhhhhhhhhhhhhhhhhhhhsssssssssssss");
      return ServiceResult.success(response);
    } catch (errro) {
      print("sfdadsssssssssssssssssssssssssss");
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }
    }

  Future<ServiceResult<List<ModelsModel>>> getModels() async {

    try{
      final response = await chatApiRepo.getModels();
      return ServiceResult.success(response);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }

  }


}