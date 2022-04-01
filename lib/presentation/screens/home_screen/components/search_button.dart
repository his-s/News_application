import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final bool isSearching;
  final VoidCallback? onPressed;

  const SearchButton({Key? key, this.isSearching = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        !isSearching ? Icons.search : Icons.clear,
        color: Colors.black,
      ),
    );
  }
}
