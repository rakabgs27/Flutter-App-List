import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/api/crud_network.dart';

class EditKategori extends StatefulWidget {
  const EditKategori({Key? key}) : super(key: key);

  @override
  State<EditKategori> createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  final TextEditingController txtAddCategory = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Kategori"),
        backgroundColor: const Color(0xFF0000ff),
      ),
      body: Container(
        child: Text("Masuk"),
      ),
    );
  }
}