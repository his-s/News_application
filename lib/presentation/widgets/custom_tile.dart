import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData leadingIcon;
  final double contentWidth;
  final String title;
  final VoidCallback onTap;
  final Color leadingIconColor;
  final Color titleColor;
  final Color tileColor;

  const CustomTile({
    Key? key,
    required this.leadingIcon,
    this.contentWidth = 10.0,
    this.title = "",
    required this.onTap,
    this.leadingIconColor = Colors.white,
    this.titleColor = Colors.white,
    this.tileColor = Colors.transparent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              size: 30,
              color: leadingIconColor,
            ),
            SizedBox(
              width: contentWidth,
            ),
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
