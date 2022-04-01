import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final bool isSearching;
  final ValueChanged<String>? onChanged;
  const AppBarTitle({Key? key, this.isSearching = false, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isSearching) {
      return const Text(
        "First Eye",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );
    }
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
