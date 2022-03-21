import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class MediumTitleWidget extends StatelessWidget {
  final String text;
  final Widget? icon;
  const MediumTitleWidget({Key? key, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AdaptativeTheme.mediumSpace),
          child: icon ?? const SizedBox.shrink(),
        ),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
