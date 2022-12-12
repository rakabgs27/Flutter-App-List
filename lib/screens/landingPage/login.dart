import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/screens/landingPage/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  var defaultText = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login Page"),
          backgroundColor: const Color(0xFF0000ff),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100.0,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
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
                          onPressed: () {},
                          child: const Text("Login",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                              ))),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                      children: [
                        TextSpan(style: defaultText, text: "Tidak Punya Akun ?"),
                        ]
                        )
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Register()));
                      },
                      child: const Text('Klik Disini!')),
                ],
              ),
            ],
          ),
        ));
  }
}
