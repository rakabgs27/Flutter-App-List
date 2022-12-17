import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tugas_besar/screens/homePage/home.dart';
import 'package:flutter_tugas_besar/screens/landingPage/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/network.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text: 'password');
  var Token = '';
  var defaultText = const TextStyle(color: Colors.black);
  bool _autoValidate = false;

  Future doLogin() async {
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await Network().login(email, password, deviceId);
    print(response.body);

    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    Token = '$value';
    if (token == null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Login(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                        color: Colors.grey.withOpacity(.1)),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.05),
                    radius: 25,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/FlutterBricksLogo-Med.png?alt=media&token=7d03fedc-75b8-44d5-a4be-c1878de7ed52"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Email atau Password Salah",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
    // print(Token);
  }

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
                      controller: txtEmail,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: txtPassword,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                      ),
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
                          onPressed: () {
                            // if (_formKey.currentState!.validate() &&
                            //     Token == '') {
                            //   doLogin();
                            // } else if (_formKey.currentState!.validate() &&
                            //     Token != '') {
                            //   doLogin();
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       backgroundColor: Colors.white,
                            //       content: Text(
                            //         'Validation Successful',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   );
                            // } else {}
                            doLogin();
                          },
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
                      text: TextSpan(children: [
                    TextSpan(style: defaultText, text: "Tidak Punya Akun ?"),
                  ])),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                      child: const Text('Klik Disini!')),
                ],
              ),
            ],
          ),
        ));
  }
}
