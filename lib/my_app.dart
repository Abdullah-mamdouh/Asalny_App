import 'package:chat_gpt_groups/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<ChatCubit>(create: (context) => getIt<ChatCubit>()),
      ],
      child: MaterialApp(
            title: 'My App',
            theme: ThemeData(
              //primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.homeScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),
    );
  }
}
