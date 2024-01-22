import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final int? flex;
  const TitleText({super.key, this.text, this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex?? 1,
        child: Text(
      text ?? 'Title',
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold),
      
    ));
  }
}
