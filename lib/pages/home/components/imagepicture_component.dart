// ignore_for_file: avoid_print

library imagepicture_component;

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

class ImagePicture extends StatefulWidget {
  const ImagePicture({Key? key}) : super(key: key);

  @override
  State<ImagePicture> createState() {
    return _ImagePictureState();
  }
}

class _ImagePictureState extends State<ImagePicture> {
  String? userPhotoUrl;
  String defaultUrl =
      'https://icon-library.com/images/2018/2455327_ram-g-skill-f3-12800cl9d-8gbxl-8gb-4gbx2.png';

  @override
  initState() {
    super.initState();
    getProfilImage();
  }

  getProfilImage() {
    Reference storageRef = storage.ref('Users').child('test.jpg');
    storageRef.getDownloadURL().then((downloadUrl) {
      setState(() {
        userPhotoUrl = downloadUrl.toString();
      });
    }).catchError((error) {
      print('Une erreur est survenue : ${error.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Storage Example'),
        ),
        body: Center(
            child: SizedBox(
          height: 300,
          width: 300,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: userPhotoUrl == null
                ? NetworkImage(defaultUrl)
                : NetworkImage(userPhotoUrl!),
          ),
        )));
  }
}
