import 'package:devnote/models/note_model.dart';
import 'package:flutter/cupertino.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(NoteModel newNote) {
    _notes.add(newNote);
  }
}
