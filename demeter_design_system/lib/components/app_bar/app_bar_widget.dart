import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const AppBarWidget({Key? key, this.title = "", this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
          gradient: const LinearGradient(
            colors: [Color(0xFF364976), Color(0xFF212E49), Color(0xFF1B253B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.8, 1],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
