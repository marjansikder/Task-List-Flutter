import 'package:flutter/material.dart';
import 'package:task_list/src/service/sqlite_helper.dart';

import '../model/notes.dart';

class TasksProviders extends ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Task> tasks = [];
  List<Task> searchResult = [];

  void selectTasks() async {
    await dbHelper.init();
    tasks = await dbHelper.queryNotes();
    notifyListeners();
    await dbHelper.closeDatabase();
  }

  void searchTasks(String keywords) async {
    await dbHelper.init();
    searchResult = await dbHelper.searchInDatabase(keywords);
    notifyListeners();
    await dbHelper.closeDatabase();
  }

  void resultClear() {
    searchResult = [];
    notifyListeners();
  }


  void insertTask(title, description, status) async {
    await dbHelper.init();
    Map<String, dynamic> row = {
      DatabaseHelper.noteTitle: title,
      DatabaseHelper.noteDescription: description,
      DatabaseHelper.noteStatus: status,
      DatabaseHelper.noteInsertDatetime: DateTime.now().toIso8601String(),
      DatabaseHelper.noteUpdateDatetime: DateTime.now().toIso8601String(),
      DatabaseHelper.noteDeleteDatetime: ''
    };
    await dbHelper.insert(row);
    await dbHelper.closeDatabase();
    selectTasks();
  }

  Future<Task> selectTask(int id) async {
    await dbHelper.init();
    List<Task> onenotes = await dbHelper.queryNote(id);
    await dbHelper.closeDatabase();
    return onenotes.first;
  }

  void updateTask(int id, String title, String description,String status) async {
    await dbHelper.init();
    Map<String, dynamic> row = {
      DatabaseHelper.noteId: id,
      DatabaseHelper.noteTitle: title,
      DatabaseHelper.noteDescription: description,
      DatabaseHelper.noteStatus: status,
      DatabaseHelper.noteUpdateDatetime: DateTime.now().toIso8601String()
    };
    await dbHelper.update(row);
    await dbHelper.closeDatabase();
    selectTasks();
  }

  void deleteTask(int id) async {
    await dbHelper.init();
    await dbHelper.moveToTrash(id);
    await dbHelper.closeDatabase();
    selectTasks();
  }

  void restoreNote(int id) async {
    await dbHelper.init();
    await dbHelper.restoreFromTrash(id);
    await dbHelper.closeDatabase();
    selectTasks();
  }

  void deleteTaskPermanent(int id) async {
    await dbHelper.init();
    await dbHelper.delete(id);
    await dbHelper.closeDatabase();
  }

  void deleteTrashPermanent() async {
    await dbHelper.init();
    await dbHelper.deleteAllTrash();
    await dbHelper.closeDatabase();
  }

  void deleteOldTrash() async {
    await dbHelper.init();
    await dbHelper.deleteOldTrashNotes();
    await dbHelper.closeDatabase();
  }
}
