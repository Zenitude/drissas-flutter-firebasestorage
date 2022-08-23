library appbar_widget;

import 'package:flutter/material.dart';
import 'package:my_app/pages/profil/profil_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  refreshPage(context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProfilPage(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            refreshPage(context);
          },
        )
      ],
    );
  }
}
