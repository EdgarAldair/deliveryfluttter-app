import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/api/environment.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProviders {
  // ignore: prefer_final_fields
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  late BuildContext context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseApi?> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
