// ignore_for_file: avoid_print

library connection_widget;

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

getUserId() {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    print('Vous êtes sur une plateforme mobile');
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        try {
          print('Utilisateur non connecté');
          auth.signInWithEmailAndPassword(
              email: 'elon-musk@gmail.com', password: 'elonmusk');
        } catch (error) {
          print(error.toString());
        }
      } else {
        print("Utilisateur connecté : ${user.email}");
      }
    });
  } else {
    print('Vous êtes sur votre PC');
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        try {
          print('Utilisateur non connecté');
          auth.signInWithEmailAndPassword(
              email: 'elon-musk@gmail.com', password: 'elonmusk');
        } catch (error) {
          print(error.toString());
        }
      } else {
        print("Utilisateur connecté : ${user.email}");
      }
    });
  }
}
