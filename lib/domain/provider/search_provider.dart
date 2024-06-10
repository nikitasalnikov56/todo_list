import 'package:flutter/material.dart';
import 'package:todo_list/domain/database/hive_box.dart';
import 'package:todo_list/domain/database/notes_data.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider() {
    filteredNotes = allNotes;
    searchController.addListener(search);
  }

  final searchController = TextEditingController();
  var filteredNotes = <NotesData>[];
  final allNotes = HiveBox.notes.values.toList();

  void search() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = allNotes
          .where(
            (value) =>
                value.title!.toLowerCase().contains(query.toLowerCase()) ||
                value.text!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      notifyListeners();
    } else {
      filteredNotes = allNotes;
      notifyListeners();
    }
  }
}
