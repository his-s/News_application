import 'package:flutter/material.dart';

class BookmarkOrDeletButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isBookmarks;

  const BookmarkOrDeletButton({
    Key? key,
    required this.onPressed,
    this.isBookmarks = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          color: Colors.black,
          onPressed: onPressed,
          icon: Icon(
              !isBookmarks ? Icons.bookmark_outline_outlined : Icons.delete),
        ),
      ),
    );
  }
}
