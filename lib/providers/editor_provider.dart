import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:devnote/models/note_model.dart';

class EditorProvider extends ChangeNotifier {
  QuillController _editorController = QuillController.basic();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  QuillController get editorController => _editorController;
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;

  void loadEditor(NoteModel note) {
    _titleController.text = note.title ?? '';
    _descriptionController.text = note.description ?? '';
    _editorController = QuillController(
      document: Document.fromDelta(note.data!),
      selection: const TextSelection.collapsed(offset: 0),
    );

    notifyListeners();
  }

  void clearEditor() {
    _editorController.clear();
    _titleController.clear();
    _descriptionController.clear();

    notifyListeners();
  }
}
