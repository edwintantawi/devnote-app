import 'package:flutter_quill/flutter_quill.dart';

class NoteModel {
  String id;
  String? title;
  String? description;
  Delta? data;
  bool isBookmarked;

  NoteModel({
    required this.id,
    this.title,
    this.description,
    this.data,
    required this.isBookmarked,
  });
}
