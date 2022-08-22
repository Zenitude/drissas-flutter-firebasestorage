// ignore_for_file: avoid_print, unnecessary_null_comparison

library home_page;

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/widgets/appbar_widget.dart';
import 'package:my_app/pages/home/components/buttonsendfirebase_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();

  // Future uploadFile() async {
  //   Reference storageRef = storage.ref('Users').child('test.png');
  //   UploadTask uploadTask = storageRef.putFile(_image!);
  //   await uploadTask.whenComplete(() => print('File uploaded'));
  // }

  Future getImage() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Image Picker Example'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? const Text('No image selected.')
                  : Image.file(_image!),
              ButtonSendFirebase(file: _image,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
