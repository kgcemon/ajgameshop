import 'package:flutter/material.dart';

class ProfileOrderStausButton extends StatelessWidget {
  final String title;
  final String count;

  const ProfileOrderStausButton({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 20)),
        Text(title),
      ],
    );
  }
}
