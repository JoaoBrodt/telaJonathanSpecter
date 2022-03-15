import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool shadows;
  const AppBarWidget(
      {Key? key, this.title = "", this.actions, this.shadows = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      centerTitle: false,
      actions: actions,
      bottomOpacity: 0,
      shadowColor: !shadows ? Colors.transparent : null,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: !shadows
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
          gradient: LinearGradient(
            colors: [
              const Color(0xFF364976),
              const Color(0xFF1F2B44),
              Theme.of(context).colorScheme.secondary
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.5, 0.9],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, shadows ? 70 : 50);
}
