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
          padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
        AdaptativeTheme.mediumSpace,
        getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
        AdaptativeTheme.mediumSpace,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: getProportionateScreenWidth(AdaptativeTheme.smallSpace)),
            child: icon,
          ),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
