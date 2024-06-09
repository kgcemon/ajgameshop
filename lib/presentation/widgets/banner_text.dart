import 'package:flutter/material.dart';

class BannerText extends StatelessWidget {
  BannerText({super.key, required this.titel, required this.des});

  final titel;
  final des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titel',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(height: 10),
          Text(
            '$des',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
