import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget{
  const MyBullet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 5,
        width: 5,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}