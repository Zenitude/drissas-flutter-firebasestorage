library bottomporfil_component;

import 'package:flutter/material.dart';

class BottomProfil extends StatefulWidget {
  const BottomProfil({Key? key}) : super(key: key);

  @override
  State<BottomProfil> createState() {
    return _BottomProfilState();
  }
}

class _BottomProfilState extends State<BottomProfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonUpdateProfil(),
              textSection(),
              //imageSendFirebase('https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
              //buttonSendFirebase(),
            ]),
      ),
    );
  }

  buttonUpdateProfil() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: Container(
          width: 150,
          height: 30,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Center(
            child:
                Text('Modifier ma photo', style: TextStyle(color: Colors.white)),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  textSection() {
    return Column(
      children: const [
        Text('Sélectionnez une image',
            style: TextStyle(color: Colors.black, fontSize: 12)),
        Text('Puis enregistrez-la dans Firebase',
            style: TextStyle(color: Colors.black, fontSize: 12)),
      ],
    );
  }

  imageSendFirebase(String urlImageProfil) {
    return Container(
        width: 125,
        height: 125,
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(105)),
            boxShadow: 
            [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0,1)
              )
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(105)),
          child: Image(
            image: NetworkImage(urlImageProfil),
            fit: BoxFit.cover,
          ),
        ));
  }

  buttonSendFirebase() {
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
        onPressed: () {},
      ),
    );
  }
}
