import 'package:demeter_design_system/demeter_design_system.dart';
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
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(
              getProportionateScreenWidth(AdaptativeTheme.defaultSpace))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            child: icon,
          ),
          Flexible(
            child: Text(text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.labelMedium
                // ?.copyWith(fontSize: getProportionateScreenWidth(16)),
                ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
