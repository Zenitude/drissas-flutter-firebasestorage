library body_profil_component;

import 'package:flutter/material.dart';
import 'package:my_app/pages/profil/components/topprofil_component.dart';
import 'package:my_app/pages/profil/components/bottomprofil_component.dart';

class BodyProfil extends StatefulWidget {
  const BodyProfil({Key? key}) : super(key: key);

  @override
  State<BodyProfil> createState() {
    return _BodyProfilState();
  }
}

class _BodyProfilState extends State<BodyProfil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          TopProfil(),
          BottomProfil(),
        ]
      ),
    );
  }
}
