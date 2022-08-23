// ignore_for_file: avoid_print, unnecessary_null_comparison

library bottomporfil_component;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/pages/profil/components/sub_components/bottom_profil/textsection_component.dart';
import 'package:my_app/pages/profil/components/sub_components/bottom_profil/imageselected_component.dart';
import 'package:my_app/pages/profil/components/sub_components/bottom_profil/sendimage_component.dart';

User? userCurrent = FirebaseAuth.instance.currentUser;

class BottomProfil extends StatefulWidget {
  const BottomProfil({Key? key}) : super(key: key);

  @override
  State<BottomProfil> createState() {
    return _BottomProfilState();
  }
}

class _BottomProfilState extends State<BottomProfil> {
  File? _image;
  final picker = ImagePicker();
  String userId = userCurrent!.uid;

  Future getImageGallery() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  displayImageSelected() {
    if (_image != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageSelected(urlImageSelected: _image),
          ButtonSendImage(userId: userId, image: _image),
        ],
      );
    } else {
      return const TextSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0)),
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: const Center(
                      child: Text('Modifier ma photo',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  onPressed: () {
                    getImageGallery();
                  },
                ),
              ),
              displayImageSelected(),
            ]),
      ),
    );
  }
}
