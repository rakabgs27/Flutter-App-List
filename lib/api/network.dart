import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _baseUrl = 'http://192.168.1.20:8000/api/';
  final String token = '';

  Future<Response> login(String email, String password, String deviceId) async {
    final url = Uri.parse(_baseUrl + 'auth/login');
    final body = {
      'email': email,
      'password': password,
      'device_name': deviceId
    };
    final headers = {
      'Accept': 'application/json',
    };

    final response = await post(url, body: body, headers: headers);
    var data = json.decode(response.body);
    _save('token', data['token']);
    // _save('name', data['name']);
    // _save('email', data['email']);

    return response;
  }

  Future<Response> register(String name, String email, String password, String deviceId) async {
  final url = Uri.parse(_baseUrl + 'auth/register');
  final body = {
    'name' : name,
    'email' : email,
    'password' : password,
    'password_confirmation' : password,
    'device_name' : deviceId,
  };
  final headers = {
    'Accept': 'application/json',
  };

  final response = await post(url, body: body, headers: headers);
  return response;
 }

  _save(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    //const key = 'token';
    //final value = token;
    prefs.setString(key, data);
  }

 read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
