// ignore_for_file: avoid_print

library avatar_component;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;
User? userCurrent = FirebaseAuth.instance.currentUser;

class ImageProfil extends StatefulWidget {
  const ImageProfil({Key? key}) : super(key: key);

  @override
  State<ImageProfil> createState() {
    return _ImageProfilState();
  }
}

class _ImageProfilState extends State<ImageProfil> {
  String? userPhotoUrl;
  String defaultUserPhotoUrl = 'images/iconFirebase.png';

  @override
  initState() {
    super.initState();
    getUrlImage(userCurrent!.uid);
  }

  getUrlImage(idUser) {
    Reference storageRef = storage.ref().child("Users/$idUser.png");
    storageRef.getDownloadURL().then((downloadUrl) {
      setState(() {
        userPhotoUrl = downloadUrl..toString();
        print('hey');
      });
    }).catchError((e) {
      print('Problème récup image : ${e.error}');
    });
  }

  displayImage() {
    if (userPhotoUrl != null) {
      print('url != null');
      Image.network(userPhotoUrl!);
    } else {
      print('url == null');
      Image.asset(defaultUserPhotoUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: 125,
          height: 125,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(105)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 1))
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(105)),
            child: displayImage(),
          ),
        ));
  }
}
