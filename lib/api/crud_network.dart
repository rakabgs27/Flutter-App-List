import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_tugas_besar/models/category_model.dart';

class CRUDNetwork {
  String baseUrl = 'http://192.168.1.20:8000/api/';
  String token = '';

  static Future<List<dynamic>> getCategories(String page) async {
    final String _baseUrl = 'http://localhost:8000/api/';
    var url = Uri.parse(_baseUrl + 'category?page=$page');

    List<Category> categories = [];
    List<dynamic> categoryServices = [];
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final token = prefs.get(key);
    final headers = {
      'Authorization': 'Bearer ' + '$token',
      'Accept': 'application/json',
    };

    final response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listCategories =
          (jsonObject as Map<String, dynamic>)['data'];

      var page = jsonObject['meta'];

      List listPage = page.values.toList();

      for (var category in listCategories) {
        categories.add(Category.fromJson(category));
      }

      categoryServices.add(categories);
      categoryServices.add(listPage[2]);
    }

    return categoryServices;
  }

  Future<Response> addCategory(String name) async {
    final url = Uri.parse(baseUrl + 'category');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final body = {
      'name': name,
    };
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }

  Future<Response> editCategory(Category category, String name) async {
    final url = Uri.parse(baseUrl + 'category/${category.id}');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final body = {
      'name': name,
    };
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };

    final response = await put(url, body: body, headers: headers);

    print(response.body);
    print(response.statusCode);
    return response;
  }

  Future<Response> deleteCategory(Category category) async {
    final url = Uri.parse(baseUrl + 'category/${category.id}');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + '$token',
    };

    final response = await delete(url, headers: headers);
    return response;
  }
}