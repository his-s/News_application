import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DetailsButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "Show Details",
            style: TextStyle(
              color: Color(0xff43A047),
            ),
          ),
        ),
      ],
    );
  }
}
