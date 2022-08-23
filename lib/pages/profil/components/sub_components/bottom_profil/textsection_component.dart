library textsection_component;

import 'package:flutter/material.dart';

class TextSection extends StatelessWidget
{
  const TextSection({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context)
  {
    return Column(
      children: const [
        Text('Sélectionnez une image',
            style: TextStyle(color: Colors.black, fontSize: 12)),
        Text('Puis enregistrez-la dans Firebase',
            style: TextStyle(color: Colors.black, fontSize: 12)),
      ],
    );
  }
}