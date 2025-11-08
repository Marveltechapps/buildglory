// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._internal();

  static final ApiService _apiService = ApiService._internal();

  factory ApiService() {
    return _apiService;
  }

  postRequest(String api, var object) async {
    var url = Uri.parse(api);
    debugPrint(api);
    Response? res;
    try {
      String? tokenvalue = token;
      debugPrint(tokenvalue);
      // final client = await createPinnedHttpClient();
      var response = await http.post(
        url,
        body: object,
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer $tokenvalue",
          //"checksum": dataEncryption(object, encryptionKey),
          // "userid": dataEncryption(userId, encryptionKey),
          // "password": dataEncryption(password, encryptionKey),
          // "token": sessionId,
        },
      );
      debugPrint(object);
      var body = response.body;
      debugPrint("JSON Response -- $body");
      if (response.statusCode == 200) {
        body = response.body;
      }
      res = Response(response.statusCode, body);
    } on SocketException catch (e) {
      debugPrint(e.toString());
      res = Response(
        001,
        'No Internet Connection\nPlease check your network status',
      );
    }

    debugPrint("response : <- ${res.resBody.toString()}");
    return res;
  }
}

class Response {
  int? statusCode;
  var resBody;

  Response(this.statusCode, this.resBody);
}
