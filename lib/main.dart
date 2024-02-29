import 'package:chat_gpt_groups/core/routing/app_router.dart';
import 'package:chat_gpt_groups/features/chat/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'my_app.dart';

void main() async{
  await setupGetIt();
  runApp( MyApp(appRouter: AppRouter(),));
}

