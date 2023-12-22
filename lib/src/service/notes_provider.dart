import 'package:flutter/material.dart';
import 'package:task_list/src/service/sqlite_helper.dart';

import '../model/notes.dart';

class NotesProviders extends ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Note> notes = [];
  List<Note> trashnotes = [];
  List<Note> searchResult = [];

  void selectNotes() async {
    await dbHelper.init();
    notes = await dbHelper.queryNotes();
    notifyListeners();
    await dbHelper.closeDatabase();
  }

  void searchNotes(String keywords) async {
    await dbHelper.init();
    searchResult = await dbHelper.searchInDatabase(keywords);
    notifyListeners();
    await dbHelper.closeDatabase();
  }

  void resultClear() {
    searchResult = [];
    notifyListeners();
  }

  void selectTrashNotes() async {
    await dbHelper.init();
    trashnotes = await dbHelper.queryTrashNotes();
    notifyListeners();
    await dbHelper.closeDatabase();
  }

  void insertNote(title, description, status) async {
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
    selectNotes();
  }

  Future<Note> selectNote(int id) async {
    await dbHelper.init();
    List<Note> onenotes = await dbHelper.queryNote(id);
    await dbHelper.closeDatabase();
    return onenotes.first;
  }

  void updateNote(int id, String title, String description,String status) async {
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
    selectNotes();
  }

  void deleteNote(int id) async {
    await dbHelper.init();
    await dbHelper.moveToTrash(id);
    await dbHelper.closeDatabase();
    selectNotes();
    selectTrashNotes();
  }

  void restoreNote(int id) async {
    await dbHelper.init();
    await dbHelper.restoreFromTrash(id);
    await dbHelper.closeDatabase();
    selectTrashNotes();
    selectNotes();
  }

  void deleteNotePermanent(int id) async {
    await dbHelper.init();
    await dbHelper.delete(id);
    await dbHelper.closeDatabase();
    selectTrashNotes();
  }

  void deleteTrashPermanent() async {
    await dbHelper.init();
    await dbHelper.deleteAllTrash();
    await dbHelper.closeDatabase();
    selectTrashNotes();
  }

  void deleteOldTrash() async {
    await dbHelper.init();
    await dbHelper.deleteOldTrashNotes();
    await dbHelper.closeDatabase();
    selectTrashNotes();
  }
}
