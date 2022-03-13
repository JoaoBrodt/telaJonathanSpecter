import 'package:flutter/material.dart';

class ButtonLargeLeftIconWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onPressed;
  const ButtonLargeLeftIconWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
