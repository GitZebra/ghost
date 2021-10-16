import 'package:flutter/material.dart';
import 'package:ghost/theme/config.dart';
//import 'package:ghost/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);
  static const routeName = '/drawer';

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
                  title: const Text('Orange'),
                  onTap: () {},
                ),
                // ListTile(
                //   title: const Text('Drak Mode'),
                //   trailing: Switch(
                //     value: MyTheme.isDark,
                //     onChanged: (value) async {
                //       SharedPreferences prefs =
                //           await SharedPreferences.getInstance();
                //       currentTheme.switchTheme(prefs);
                //       setState(() {});
                //     },
                //   ),
                // ),
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
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}










































































//////////////////////////////////////////////







// import 'package:flutter/material.dart';

// // theme: ThemeData.from(
// //         colorScheme: const ColorScheme.light(),
// //       ).copyWith(
// //         primaryColor: Colors.green,
// //         textTheme: const TextTheme(
// //           bodyText2: TextStyle(color: Colors.green),
// //         ),
// //         textButtonTheme: TextButtonThemeData(
// //           style: TextButton.styleFrom(
// //             primary: Colors.orange,
// //           ),
// //         ),
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(
// //             onPrimary: Colors.yellow,
// //             primary: Colors.blue,
// //           ),
// //         ),
// //         outlinedButtonTheme: OutlinedButtonThemeData(
// //           style: OutlinedButton.styleFrom(
// //             primary: Colors.purple,
// //             backgroundColor: Colors.green,
// //           ),
// //         ),
// //       ),
// //       // theme: ThemeData.light().copyWith(
// //       // primaryColor: Colors.green,
// //       // textTheme: const TextTheme(
// //       //   bodyText2: TextStyle(color: Colors.green),
// //       // ),
// //       // ),
// //       // darkTheme: ThemeData.dark().copyWith(
// //       //   primaryColor: Colors.purple,
// //       //   textTheme: const TextTheme(
// //       //     bodyText2: TextStyle(color: Colors.purple),
// //       //   ),
// //       // ),
// //       darkTheme: ThemeData.from(
// //         colorScheme: const ColorScheme.dark(),
// //       ).copyWith(
// //         primaryColor: Colors.green,
// //         textTheme: const TextTheme(
// //           bodyText2: TextStyle(color: Colors.purple),
// //         ),
// //         textButtonTheme: TextButtonThemeData(
// //           style: TextButton.styleFrom(
// //             primary: Colors.white30,
// //           ),
// //         ),
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(
// //             onPrimary: Colors.green,
// //             primary: Colors.white30,

// //           ),
// //         ),
// //         outlinedButtonTheme: OutlinedButtonThemeData(
// //           style: OutlinedButton.styleFrom(
// //             primary: Colors.redAccent,
// //             backgroundColor: Colors.blueGrey,
// //           ),
// //         ),
// //       ),
// //       // NOTE: Optional - use themeMode to specify the startup theme
// //       themeMode: ThemeMode.system,
// //       // theme: ThemeData(
// //       //   primarySwatch: Colors.blue,
// //       // ),

// class Loal extends StatelessWidget {
//   const Loal({Key? key}) : super(key: key);

//   get raisedButtonStyle => null;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(12.0),
//       child: ListView(
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const <Widget>[
//               CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/monkey.jpg'),
//                 radius: 24,
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Welcome'),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(
//             style: raisedButtonStyle,
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => const MyHome(),
//               //   ),
//               // );
//             },
//             child: const Text('Go Home'),
//           )
//         ],
//       ),
//     );
//   }
// }
