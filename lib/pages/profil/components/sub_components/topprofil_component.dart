// ignore_for_file: avoid_print

library image_component;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/pages/profil/components/sub_components/top_profil/avatar_component.dart';
import 'package:my_app/pages/profil/components/sub_components/top_profil/textsection_component.dart';

User? userCurrent = FirebaseAuth.instance.currentUser;

class TopProfil extends StatefulWidget {
  const TopProfil({Key? key}) : super(key: key);

  @override
  State<TopProfil> createState() {
    return _TopProfilState();
  }
}

class _TopProfilState extends State<TopProfil> {
  String userId = userCurrent!.uid;
  CollectionReference firestoreRef =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: firestoreRef.doc(userId).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(
              'Une erreur lors du chargement des données est survenue.');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print(userId);
          print('Connecté à la base de données');
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          final String location =
              "${data['city'].toString()}, ${data['country'].toString()}";

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
                const ImageProfil(),
                TextSection(
                    dataField: data['name'].toString(),
                    colorField: Colors.white,
                    sizeField: 18,
                    weightField: FontWeight.bold),
                TextSection(
                    dataField: data['companies'].toString(),
                    colorField: Colors.white,
                    sizeField: 14,
                    weightField: FontWeight.normal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                    TextSection(
                        dataField: location,
                        colorField: Colors.white,
                        sizeField: 14,
                        weightField: FontWeight.normal),
                  ],
                ),
              ],
            )),
          );
        }
        return const Text('Chargement des données en cours...');
      },
    );
  }
}
