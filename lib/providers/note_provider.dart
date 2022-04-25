import 'package:flutter/material.dart';

import 'package:devnote/models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  List<NoteModel> get bookmarkedNotes {
    return _notes.where((note) => note.isBookmarked == true).toList();
  }

  void addNote(NoteModel newNote) {
    _notes.add(newNote);

    notifyListeners();
  }

  void updateNote(NoteModel newNote) {
    int noteIndex = _notes.indexWhere((note) => note.id == newNote.id);
    if (noteIndex == -1) return;
    _notes[noteIndex] = newNote;

    notifyListeners();
  }

  void deleteNote(String noteId) {
    int noteIndex = _notes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;
    _notes.removeAt(noteIndex);

    notifyListeners();
  }

  void toggleNoteToBookmark(String noteId) {
    int noteIndex = _notes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;
    _notes[noteIndex].isBookmarked = !_notes[noteIndex].isBookmarked;

    notifyListeners();
  }
}
