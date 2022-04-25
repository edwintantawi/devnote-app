import 'package:flutter/material.dart';

import 'package:devnote/screens/bookmark_screen.dart';

class BookmarkNoteIconButton extends StatelessWidget {
  const BookmarkNoteIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BookmarkScreen()),
        );
      },
      icon: const Icon(Icons.bookmark),
    );
  }
}
