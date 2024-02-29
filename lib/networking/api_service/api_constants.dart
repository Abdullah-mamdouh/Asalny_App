class ApiChatConstants {
  static const String BASE_URL = "https://api.openai.com/v1/";
  static const String models = "models";
  static const String chat = "chat/completions";
  static const String completions = "completions";

  static const String API_KEY = "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";
  static const Map<String, dynamic> headers =  {
    'Authorization': 'Bearer ${ApiChatConstants.API_KEY}',
    "Content-Type": "application/json"
  };
}
/*
class ApiNotificationConstants {
  static const String baseUrl = "https://fcm.googleapis.com/fcm/";


  static const String send = "send";
}
*/
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
