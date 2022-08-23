library imageselected_component;

import 'dart:io';
import 'package:flutter/material.dart';

class ImageSelected extends StatefulWidget {
  const ImageSelected({Key? key, required this.urlImageSelected})
      : super(key: key);

  final File? urlImageSelected;

  @override
  State<ImageSelected> createState() {
    return _ImageSelectedState();
  }
}

class _ImageSelectedState extends State<ImageSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
      child: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(widget.urlImageSelected!.path, scale: 0.5)),
    );
  }
}
