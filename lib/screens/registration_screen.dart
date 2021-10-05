import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReregistrationScreen extends StatefulWidget {
  const ReregistrationScreen({Key key}) : super(key: key);

  @override
  _ReregistrationScreenState createState() => _ReregistrationScreenState();
}

class _ReregistrationScreenState extends State<ReregistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: const Center(
        child: Text("Reregistration Screen"),
      ),
    );
  }
}
