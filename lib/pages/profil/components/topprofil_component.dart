library image_component;

import 'package:flutter/material.dart';

class TopProfil extends StatefulWidget {
  const TopProfil({Key? key}) : super(key: key);

  @override
  State<TopProfil> createState() {
    return _TopProfilState();
  }
}

class _TopProfilState extends State<TopProfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 247, 216, 102),
            Color.fromARGB(255, 193, 121, 14)
          ],
        ),
      ),
      child: Center(
          child: Column(
        children: [
          imageProfil(
              'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
          titleProfil('Elon Musk'),
          companyProfil('CEO of SpaceX and Tesla'),
          locationProfil('Los Angeles, USA'),
        ],
      )),
    );
  }

  imageProfil(String urlImageProfil) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
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
          )),
    );
  }

  titleProfil(String nameProfil) {
    return Text(
      nameProfil,
      style: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  companyProfil(String nameCompanies) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        nameCompanies,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  locationProfil(String geolocation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_pin,
          color: Colors.white,
        ),
        Text(
          geolocation,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
