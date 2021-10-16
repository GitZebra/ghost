import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ghost/screens/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  get raisedButtonStyle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 30.0,
        ),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/monkey.jpg'),
                  radius: 24,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Welco-',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text("""Woah There!! Identify yourself.
              Who are you?"""),
            ),
            const SizedBox(
              height: 45,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('_isNotStart', true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHome(),
                          ),
                        );
                      },
                      child: const Text('An idiot'),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('_isNotStart', true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHome(),
                          ),
                        );
                      },
                      child: const Text('A Monkey'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const Center(
                  child: Text(
                    "Well, either way it doesn't matter. In the end, you're just an IDIOT.",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 225.0,
                ),
                const Center(
                  child: Text(
                    "By using this app you agree on giving all you data (personal or for idk everything) to the thinking monkey.",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     SharedPreferences prefs = await SharedPreferences.getInstance();
      //     prefs.setBool('_isNotStart', true);
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const MyHome(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.keyboard_arrow_right_sharp),
      //   elevation: 4,
      //   hoverColor: Colors.red,
      //   backgroundColor: Colors.green,
      // ),
    );
  }
}
