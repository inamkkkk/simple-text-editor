import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_text_editor/screens/editor_screen.dart';
import 'package:simple_text_editor/services/note_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => NoteService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Text Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EditorScreen(),
    );
  }
}