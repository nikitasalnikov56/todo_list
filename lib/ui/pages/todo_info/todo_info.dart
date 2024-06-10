import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/domain/database/hive_box.dart';
import 'package:todo_list/ui/routes/app_routes.dart';

class TodoInfo extends StatelessWidget {
  const TodoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final allNotes = HiveBox.notes.values.toList();

    final int index = GoRouterState.of(context).extra as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(allNotes[index].title.toString()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text('''${allNotes[index].text} '''),
      ),
    );
  }
}
