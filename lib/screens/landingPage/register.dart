import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/api/network.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  doRegister() async {
    final name = txtName.text;
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await Network().register(name, email, password, deviceId);
    print(response.body);
    Navigator.pushNamed(context, "/");
  }

  final TextEditingController txtName = TextEditingController(text: 'test');
  final TextEditingController txtEmail =
      TextEditingController(text: 'test@mail.com');
  final TextEditingController txtPassword =
      TextEditingController(text: 'password');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Register Page"),
          backgroundColor: const Color(0xFF0000ff),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                  )),
              TextFormField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                  )),
              TextFormField(
                  controller: txtPassword,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0000ff),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      doRegister();
                    },
                    child: const Text("Register",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ))),
              )
            ],
          ),
        ));
  }
}
