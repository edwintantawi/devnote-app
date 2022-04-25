import 'package:flutter/material.dart';

class BookmarkIcon extends StatelessWidget {
  final bool isBookmarked;

  const BookmarkIcon({
    Key? key,
    required this.isBookmarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
      color: Colors.white,
    );
  }
}
