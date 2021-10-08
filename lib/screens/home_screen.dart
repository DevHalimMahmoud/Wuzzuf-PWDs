import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getUserid();
  }

  bool ready = false;
  String userid;
  String userName;

  getUserid() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    userid = user.uid;
    getUserName();
  }

  getUserName() async {
    var user =
        await Firestore.instance.collection('users').document(userid).get();
    userName = user['f_name'];
    ready = true;
    if (mounted) {
      setState(() {});
    }
  }

  final String welcomeText = '''We're so happy you're here!
Wish you great job opportunities''';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ready
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome, $userName',
                      style: const TextStyle(fontSize: 32)),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    welcomeText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  // SizedBox(
                  //   height: size.height*0.4,
                  //   child: const FittedBox(
                  //     child: Icon(
                  //        Icons.local_florist
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
