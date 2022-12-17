import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/api/crud_network.dart';
import 'package:flutter_tugas_besar/models/category_model.dart';

import '../homePage/home.dart';

class EditKategori extends StatefulWidget {
  const EditKategori({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  State<EditKategori> createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  TextEditingController? txtEditCategory;

   doEditCategory() async{
    final name = txtEditCategory?.text;
    final response = await CRUDNetwork().editCategory(widget.category, name!);
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtEditCategory = TextEditingController(text: widget.category.name);
  }

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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: txtEditCategory,
                decoration: InputDecoration(
                  hintText: "Edit Kategori Baru",
                  labelText: "Edit Kategori",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  suffixIcon: Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                    child: ElevatedButton(
                      child: const Text("Edit"),
                      onPressed: () {
                        doEditCategory();
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