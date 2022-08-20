library profil_page;

import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar_widget.dart';
import 'package:my_app/pages/profil/components/body_profil_component.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() {
    return _ProfilPageState();
  }
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Page de profil'),
      body: BodyProfil(),
    );
  }
}
