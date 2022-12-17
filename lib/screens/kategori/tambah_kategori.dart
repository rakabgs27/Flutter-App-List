import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/api/crud_network.dart';
import 'package:flutter_tugas_besar/screens/homePage/home.dart';

import '../../api/network.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  State<TambahKategori> createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
  final TextEditingController txtAddCategory = TextEditingController();

  doAddCategory() async {
    final name = txtAddCategory.text;
    final response = await CRUDNetwork().addCategory(name);
    print(response.body);
    txtAddCategory.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tambah Kategori"),
        backgroundColor: const Color(0xFF0000ff),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: txtAddCategory,
                decoration: InputDecoration(
                  hintText: "Masukkan Kategori Baru",
                  labelText: "Tambah Kategori",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  suffixIcon: Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                    child: ElevatedButton(
                      child: const Text("Tambah"),
                      onPressed: () {
                        doAddCategory();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
