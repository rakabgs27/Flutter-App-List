import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: const Color(0xFF0000ff),
          automaticallyImplyLeading: false,
        ),
        body: Container(
         child: Text("Masuk"),
        ));
  }
}