import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:devnote/components/app_shell.dart';
import 'package:devnote/components/empty_state.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:devnote/components/note_list/note_list_view.dart';
import 'package:devnote/components/buttons/add_note_fab.dart';
import 'package:devnote/components/buttons/settings_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return AppShell(
      title: const Text('DevNote'),
      actions: const [SettingsIconButton()],
      fab: const AddNoteFAB(),
      body: noteProvider.notes.isNotEmpty
          ? const NoteListView()
          : const Center(child: EmptyState()),
    );
  }
}
