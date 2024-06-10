import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/domain/database/hive_box.dart';
import 'package:todo_list/domain/database/notes_data.dart';
import 'package:todo_list/ui/routes/app_routes.dart';

class TodoProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  //добавление заметки
  //async - все асинхронные функции помечаются этим словом
  //await - ожидание обращения в Базе Данных
  Future<void> addNote(BuildContext context) async {
    await HiveBox.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty ? titleController.text : '',
            text: textController.text.isNotEmpty ? textController.text : '',
          ),
        )
        .then((value) => context.go(AppRoutes.home))
        .then((value) => controllersClear());
  }

//очищение контроллеров
  controllersClear() {
    titleController.clear();
    textController.clear();
  }

//удаление заметки
  Future<void> deleteNote(int index) async {
    await HiveBox.notes.deleteAt(index);
  }

// новый код
//редактирование заметки
  Future<void> changeNote(BuildContext context, int index) async {
    final allNotes = HiveBox.notes.values.toList();
    await HiveBox.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : allNotes[index].title,
            text: textController.text.isNotEmpty
                ? textController.text
                : allNotes[index].text,
          ),
        )
        .then((value) => context.go(AppRoutes.home))
        .then((value) => controllersClear());
  }

  //отметка сделанной заметки
  Future<void> checkNote(int index) async {
    final allNotes = HiveBox.notes.values.toList();
    await HiveBox.notes.putAt(
      index,
      NotesData(
        title: allNotes[index].title,
        text: allNotes[index].text,
        isChecked: true,
      ),
    );
  }

  //работа с BottomNavigationBar
  int curIndex = 0;
  bool isActive = true;
  onTap(int value) {
    curIndex = value;
    if (curIndex == 0) {
      isActive = true;
    } else {
      isActive = false;
    }
    notifyListeners();
  }
}
