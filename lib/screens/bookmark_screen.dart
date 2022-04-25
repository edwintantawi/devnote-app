import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'package:devnote/components/app_shell.dart';
import 'package:devnote/components/note_list/note_list_view.dart';
import 'package:devnote/providers/note_provider.dart';
import 'package:devnote/components/empty_state.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return AppShell(
      title: Text('TR_BOOKMARK'.tr()),
      body: noteProvider.notes.isNotEmpty
          ? NoteListView(notes: noteProvider.bookmarkedNotes)
          : Center(
              child: EmptyState(
                description: 'TR_EMPTY.BOOKMARK'.tr(),
                icon: Icons.bookmarks_sharp,
              ),
            ),
    );
  }
}
