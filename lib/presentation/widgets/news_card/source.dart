import 'package:flutter/material.dart';

class SourceWidget extends StatelessWidget {
  final String title;
  final String date;
  final Color color;
  final IconData icon;

  const SourceWidget(
      {Key? key,
      this.title = "",
      this.date = "",
      this.color = Colors.grey,
      this.icon = Icons.save})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              date,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
