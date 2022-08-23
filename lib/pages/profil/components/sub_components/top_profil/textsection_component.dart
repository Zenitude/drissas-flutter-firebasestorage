library compagnies_component;

import 'package:flutter/material.dart';

class TextSection extends StatefulWidget {
  const TextSection(
      {Key? key,
      required this.dataField,
      required this.colorField,
      required this.sizeField,
      required this.weightField})
      : super(key: key);

  final String dataField;
  final Color colorField;
  final double sizeField;
  final FontWeight weightField;

  @override
  State<TextSection> createState() {
    return _TextSectionState();
  }
}

class _TextSectionState extends State<TextSection> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
          widget.dataField,
          style: TextStyle(
            color: widget.colorField,
            fontSize: widget.sizeField,
            fontWeight: widget.weightField,
          ),
        ),
    );
  }
}
