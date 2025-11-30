import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteService extends ChangeNotifier {
  String _note = '';
  String get note => _note;

  Future<void> saveNote(String content) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('note', content);
    _note = content;
    notifyListeners();
  }

  Future<void> loadNote() async {
    final prefs = await SharedPreferences.getInstance();
    _note = prefs.getString('note') ?? '';
    notifyListeners();
  }
}