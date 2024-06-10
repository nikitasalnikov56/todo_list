import 'package:go_router/go_router.dart';
import 'package:todo_list/ui/pages/add_page/add_page.dart';
import 'package:todo_list/ui/pages/completed_page/completed_page.dart';
import 'package:todo_list/ui/pages/edit_page/edit_page.dart';
import 'package:todo_list/ui/pages/home_page/home_page.dart';
import 'package:todo_list/ui/pages/search_page/search_page.dart';
import 'package:todo_list/ui/pages/todo_info/todo_info.dart';
import 'package:todo_list/ui/routes/app_routes.dart';

abstract class AppNavigator {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.add,
        builder: (context, state) => const AddPage(),
      ),
      GoRoute(
        path: AppRoutes.edit,
        builder: (context, state) => const EditPage(),
      ),
      GoRoute(
        path: AppRoutes.completed,
        builder: (context, state) => const CompletedPage(),
      ),
      GoRoute(
        path: AppRoutes.todoInfo,
        builder: (context, state) => const TodoInfo(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
