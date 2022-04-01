import 'package:flutter/material.dart';

class DetailsDescription extends StatelessWidget {
  final String description;

  const DetailsDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (description.isNotEmpty) {
      return Column(
        children: [
          Text(
            description,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
