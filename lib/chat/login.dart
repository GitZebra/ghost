import 'package:flutter/material.dart';
import 'package:ghost/chat/methods.dart';
import 'package:ghost/chat/chat_screen.dart';
import 'package:ghost/chat/create_account.dart';
import 'package:ghost/screens/home.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _emailValidate = false;
  bool _passValidate = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_sharp),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHome(),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue,
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  textField(
                    'email',
                    Icons.mail_outline_outlined,
                    TextInputType.emailAddress,
                    false,
                    _emailValidate,
                    _email,
                  ),
                  textField(
                    'password',
                    Icons.lock_outline,
                    TextInputType.visiblePassword,
                    true,
                    _passValidate,
                    _pass,
                  ),
                  const SizedBox(
                    height: 95,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MySignIn(),
                        ),
                      );
                    },
                    child: const Text(
                      'New user? Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        // color: Colors.greenAccent,
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                setState(
                  () {
                    _pass.text.isEmpty
                        ? _passValidate = true
                        : _passValidate = false;
                    _email.text.isEmpty
                        ? _emailValidate = true
                        : _emailValidate = false;
                  },
                );
                if (_pass.text.isNotEmpty && _email.text.isNotEmpty) {
                  setState(() {
                    _isLoading = true;
                  });
                  logIn(_email.text, _pass.text).then((user) {
                    if (user != null) {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyChatScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  });
                }
              },
            ),
          );
  }
}

Widget textField(String hintText, IconData icon, TextInputType keyboardType,
    bool obscureText, bool _validate, TextEditingController _text) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 8.0,
    ),
    child: TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      controller: _text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorText: _validate ? 'Can\'t Be Empty' : null,
      ),
    ),
  );
}
