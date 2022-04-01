import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          color: Colors.black,
          onPressed: onPressed,
          icon: const Icon(
            Icons.share,
          ),
        ),
      ),
    );
  }
}
