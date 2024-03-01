import 'package:chat_gpt_groups/features/chat/ui/screens/adding_chat.dart';
import 'package:chat_gpt_groups/features/chat/ui/screens/all_chats_screen.dart';
import 'package:chat_gpt_groups/features/chat/ui/screens/messages_screen.dart';
import 'package:chat_gpt_groups/features/chat/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {

      case Routes.addChatScreen:
        return MaterialPageRoute(
          builder: (_) => const AddingChat(),
        );

      case Routes.allChatsScreen:
        return MaterialPageRoute(
          builder: (_) => const AllChatsScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.messagesScreen:
        return MaterialPageRoute(
          builder: (_) => MessagesScreen(chatName: settings.arguments as String),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
