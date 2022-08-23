// ignore_for_file: avoid_print, must_be_immutable, unnecessary_null_comparison

library buttonsendfirebase_component;

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

class ButtonSendFirebase extends StatefulWidget {
  ButtonSendFirebase({Key? key, required this.file}) : super(key: key);

  File? file;

  @override
  State<ButtonSendFirebase> createState() {
    return _ButtonSendFirebaseState();
  }
}

class _ButtonSendFirebaseState extends State<ButtonSendFirebase> {
  Future uploadFile(File? file) async {
    Reference storageRef = storage.ref('Users').child('test.jpg');
    UploadTask uploadTask = storageRef.putFile(file!);
    await uploadTask.whenComplete(() => print('File uploaded'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: Container(
          width: 150,
          height: 30,
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text('Envoyez dans Firebase',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        onPressed: () {
          uploadFile(widget.file);
        },
      ),
    );
  }
}