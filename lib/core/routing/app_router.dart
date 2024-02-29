import 'package:chat_gpt_groups/features/chat/ui/screens/chat_screen.dart';
import 'package:chat_gpt_groups/features/chat/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
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
