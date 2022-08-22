// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:my_app/pages/profil/profil_page.dart';
import 'package:my_app/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getUserId();
  runApp(const MyApp());
}

FirebaseAuth auth = FirebaseAuth.instance;

getUserId() {
  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      try {
        print('Utilisateur non connecté');
        auth.signInWithEmailAndPassword(
            email: 'mail@gmail.com', password: 'testtest');
      } catch (error) {
        print(error.toString());
      }
    } else {
      print("Utilisateur connecté : ${user.email}");
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ProfilPage(),
      home: const HomePage(),
    );
  }
}
