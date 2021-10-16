import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ghost/chat/methods.dart';

import 'package:ghost/screens/home.dart';

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chat-screen';

  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final Map<String, dynamic> userMap = {};
  final _message = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _validate = false;

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
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
                const Text(
                  'Chats',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.cyanAccent,
                    fontSize: 18.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout_outlined),
                  onPressed: () {
                    logOut(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: messages.orderBy("time", descending: false).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = snapshot.data!.docs[index];
                          // return Text("${doc['message']} by ${doc['sendby']}");
                          return Container(
                            width: size.width,
                            alignment: doc['sendby'] == _auth.currentUser!.email
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue,
                              ),
                              child: Text(
                                doc['message'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: Text("No messages"),
                    );
                  }
                },
              ),

              // child: StreamBuilder<DocumentSnapshot>(
              //     stream: _firestore
              //         .collection('users')
              //         .doc(userMap['uid'])
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       if (snapshot.data != null) {
              //         return ListView.builder(
              //           itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           Map<String, dynamic> map = snapshot.data!.docs[index]
              //               .data() as Map<String, dynamic>;
              //           return messages(size, map, context);
              //         },
              //       );
              //       } else {
              //         return Container();
              //       }
              //     }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.78,
                    child: TextField(
                      maxLength: 90,
                      keyboardType: TextInputType.text,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _message,
                      decoration: InputDecoration(
                        hintText: 'message',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorText: _validate ? 'Can\'t Be Empty' : null,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      setState(() {
                        _message.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_message.text.isNotEmpty) {
                        await messages.add({
                          "sendby": _auth.currentUser!.email,
                          'message': _message.text,
                          'time': FieldValue.serverTimestamp(),
                          'type': 'string',
                        });
                        _message.clear();
                      }
                    },
                  ),
                ],
              ),
            ),

            // Expanded(child: null)
          ],
        ),

        /// add ListView with future Builder
      ),
    );

    /// add return to home
  }
}
