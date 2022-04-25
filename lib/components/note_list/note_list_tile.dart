import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/screens/editor_screen.dart';
import 'package:devnote/components/buttons/toggle_bookmark_icon_button.dart';

class NoteListTile extends StatelessWidget {
  final NoteModel note;

  const NoteListTile({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorProvider = Provider.of<EditorProvider>(context);

    return ListTile(
      onTap: () {
        editorProvider.loadEditor(note);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditorScreen(title: 'TR_NOTE'.tr(), note: note),
          ),
        );
      },
      title: Text(
        note.title == null || note.title == ''
            ? 'TR_UNTITLED'.tr()
            : note.title!,
      ),
      subtitle: Text(
        note.description == null || note.description == ''
            ? 'TR_NO_DESCRIPTION'.tr()
            : note.description!,
      ),
      trailing: const Icon(Icons.arrow_right),
      leading: ToggleBookmarkIconButton(note: note),
      minLeadingWidth: 32,
    );
  }
}
