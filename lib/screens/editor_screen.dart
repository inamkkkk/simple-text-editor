import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_text_editor/services/note_service.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NoteService>(context, listen: false).loadNote();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Provider.of<NoteService>(context, listen: false)
                  .saveNote(_textEditingController.text);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<NoteService>(
          builder: (context, noteService, child) {
            _textEditingController.text = noteService.note;
            return TextField(
              controller: _textEditingController,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Start typing here...',),
            );
          },
        ),
      ),
    );
  }
}