import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost/chat/login.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      users.add({
        'name': name,
        'email': email,
        'status': 'Unavailable',
      });
      return user;
    }

    // TO-DO: add snackbar
  } catch (e) {
    // TO-DO: add snackbar
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user!;
    return user;
    // TO-DO: add snackbar
  } catch (e) {
    // TO-DO: add snackbar
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyLogin(),
      ),
    );
    // TO-DO: add snackbar
  } catch (e) {
    // TO-DO: add snackbar
  }
}
