import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/routes/app_navigator.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigator.router,
      ),
    );
  }
}
