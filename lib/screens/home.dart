import 'package:flutter/material.dart';

import 'package:ghost/screens/drawer.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text(
          'Hello there! How are you?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
