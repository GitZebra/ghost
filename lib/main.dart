import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ghost/chat/authenticate.dart';
import 'package:ghost/chat/chat_screen.dart';
import 'package:ghost/chat/create_account.dart';
import 'package:ghost/chat/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:ghost/animation/route_animation.dart';
import 'package:ghost/screens/welcome.dart';
import 'package:ghost/screens/drawer.dart';
import 'package:ghost/screens/home.dart';
import 'package:ghost/theme/config.dart';
import 'package:ghost/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isNotStart = false;

  @override
  void initState() {
    super.initState();
    _loadStart();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  _loadStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MyTheme.isDark = (prefs.getBool('isDark') ?? false);
    setState(() {
      _isNotStart = (prefs.getBool('_isNotStart') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {},
      child: MaterialApp(
        // debug band
        debugShowCheckedModeBanner: false,
        // debug band
        title: 'Ghost',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
            },
          ),
          primarySwatch: Colors.teal,
          errorColor: Colors.pink,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          primaryColor: Colors.amber,
          canvasColor: const Color.fromRGBO(12, 12, 12, 0.96),
          textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'SourceSansPro',
                ),
                bodyText2: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Chilanka',
                ),
                headline1: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Chilanka',
                ),
                headline2: const TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                ),
                headline3: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                headline4: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                ),
                headline5: const TextStyle(
                  color: Colors.white54,
                  fontFamily: 'SourceSansPro',
                  fontSize: 13.0,
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
            },
          ),
          primarySwatch: Colors.teal,
          errorColor: Colors.pink,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Colors.amber,
          ),
          primaryColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 0.96),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'SourceSansPro',
                ),
                bodyText2: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Chilanka',
                ),
                headline1: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Chilanka',
                ),
                headline2: const TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                ),
                headline3: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                headline4: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                ),
                headline5: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'SourceSansPro',
                  fontSize: 13.0,
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        themeMode: currentTheme.currentTheme(),
        routes: {
          MyHome.routeName: (context) => const MyHome(),
          MyDrawer.routeName: (context) => const MyDrawer(),
          WelcomePage.routeName: (context) => const WelcomePage(),
          MyLogin.routeName: (context) => const MyLogin(),
          MyChatScreen.routeName: (context) => const MyChatScreen(),
          MySignIn.routeName: (context) => const MySignIn(),
          Authenticate.routeName: (context) => const Authenticate(),
        },
        home: _isNotStart == false ? const WelcomePage() : const MyHome(),
        //home: const WelcomePage(),
      ),
    );
  }
}
