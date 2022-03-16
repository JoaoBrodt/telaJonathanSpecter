import 'package:flutter/material.dart';

class LargeTitleWidget extends StatelessWidget {
  final String text;
  const LargeTitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
