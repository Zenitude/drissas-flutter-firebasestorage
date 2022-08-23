// ignore_for_file: avoid_print

library sendimage_component;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/pages/profil/profil_page.dart';

FirebaseStorage storage = FirebaseStorage.instance;

class ButtonSendImage extends StatefulWidget {
  const ButtonSendImage({Key? key, this.userId, this.image})
      : super(key: key);

  final String? userId;
  final File? image;

  @override
  State<ButtonSendImage> createState() {
    return _ButtonSendImageState();
  }
}

class _ButtonSendImageState extends State<ButtonSendImage> {
  Future uploadFile(File? image) async {
    Reference storageRef = storage.ref().child('Users/${widget.userId}.png');
    UploadTask uploadTask = storageRef.putFile(image!);
    await uploadTask.whenComplete(() {
      print('Photo de profil mise à jour');
      refreshPage(context);
    });
  }

  refreshPage(context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (
            _,
            __,
            ___,
          ) =>
              const ProfilPage(),
          transitionDuration: const Duration(seconds: 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: Container(
          width: 150,
          height: 40,
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text('Envoyez dans Firebase',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        onPressed: () {
          uploadFile(widget.image);
        },
      ),
    );
  }
}
