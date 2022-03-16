import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  final String name;
  final String description;
  final Widget image;
  const HelloWidget(
      {Key? key,
      required this.name,
      this.description = "",
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperWave(),
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  getProportionateScreenWidth(AdaptativeTheme.defaultSpace)),
          color: const Color(0xFF1B253B),
          height: 145,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, Julia",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Flexible(
                      child: Text(
                        description,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(50),
                child: CircleAvatar(
                    maxRadius: getProportionateScreenHeight(50),
                    child: ClipOval(child: image)),
              ),
            ],
          )),
    );
  }
}

class ClipperWave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, size.width / 2.0, size.height - 25);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
