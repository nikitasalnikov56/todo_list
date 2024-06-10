import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/components/home_body.dart';
import 'package:todo_list/ui/pages/completed_page/completed_page.dart';
import 'package:todo_list/ui/routes/app_routes.dart';
import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<Widget> screens = [
    const HomeBody(),
    const CompletedPage(),
  ];
  static List<String> title = ['TODO APP', 'Completed Task'];
  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: Text(
          title[model.curIndex].toUpperCase(),
          style: AppStyle.fontStyle,
        ),
        actions: [
          model.isActive
              ? IconButton(
                  onPressed: () {
                    context.go(AppRoutes.search);
                  },
                  icon: Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.grey,
        currentIndex: model.curIndex,
        onTap: (int value) {
          model.onTap(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
      ),
      floatingActionButton: model.isActive
          ? FloatingActionButton(
              backgroundColor: AppColors.purple,
              shape: const CircleBorder(),
              onPressed: () {
                context.go(AppRoutes.add);
              },
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            )
          : null,
      body: screens[model.curIndex],
    );
  }
}
