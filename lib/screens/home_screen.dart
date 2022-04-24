import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/providers/editor_provider.dart';
import 'package:devnote/components/app_shell.dart';
import 'package:devnote/components/empty_state.dart';
import 'package:devnote/models/note_model.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:devnote/screens/editor_screen.dart';
import 'package:devnote/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    final editorProvider = Provider.of<EditorProvider>(context, listen: false);

    return AppShell(
      title: const Text('DevNote'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          },
        ),
      ],
      fab: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.add),
        onPressed: () {
          editorProvider.clearEditor();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditorScreen()),
          );
        },
      ),
      body: noteProvider.notes.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.only(top: 12, bottom: 80),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 1);
              },
              itemCount: noteProvider.notes.length,
              itemBuilder: (BuildContext context, int index) {
                NoteModel note = noteProvider.notes[index];
                return ListTile(
                  onTap: () {
                    editorProvider.loadEditor(note);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditorScreen(title: 'TR_NOTE', note: note),
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
                );
              },
            )
          : const Center(child: EmptyState()),
    );
  }
}
