import 'package:flutter/material.dart';
import 'package:ghost/chat/authenticate.dart';
import 'package:ghost/theme/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  static const routeName = '/drawer';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/images/monkey.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null,
                  // child: Text(
                  //   'Ghost',
                  //   textAlign: TextAlign.center,
                  // ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Cat'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Apple'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Chat'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Authenticate(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.dark_mode_rounded),
                tooltip: 'Dark Mode',
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  currentTheme.switchTheme(prefs);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
