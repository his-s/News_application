import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final bool showScrolltoTopButton;
  final VoidCallback? scrollToTop;

  const ScrollToTopButton(
      {Key? key, this.showScrolltoTopButton = false, this.scrollToTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showScrolltoTopButton == true
        ? FloatingActionButton(
            backgroundColor: Colors.green.shade600,
            onPressed: scrollToTop,
            child: Icon(Icons.arrow_upward),
          )
        : const SizedBox();
  }
}
