import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ghost/chat/chat_screen.dart';
import 'package:ghost/chat/login.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);
  static const routeName = '/authenticate';

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const MyLogin();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (_auth.currentUser != null) {
            return const MyChatScreen();
          }
          return const MyLogin();
        }

        return const MyLogin();
      },
    );
  }
}











// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:ghost/chat/chat_screen.dart';
// import 'package:ghost/chat/login.dart';

// class Authenticate extends StatelessWidget {
//   Authenticate({Key? key}) : super(key: key);
//   static const routeName = '/authenticate';

//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     if (_auth.currentUser != null) {
//       return const MyChatScreen();
//     } else {
//       return const MyLogin();
//     }
//   }
// }
