import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:VPRO/APIFlowManager/api_flow_manager.dart';
import 'package:VPRO/Constants/constants.dart';
import 'package:VPRO/ModelEntity/LoginModelEntity/login_model_entity.dart';

class LoginFlowManager {
  // SingleTon get instance
  static final LoginFlowManager _instance =
      LoginFlowManager._privateConstructor();

  LoginFlowManager._privateConstructor() {
    // Init data
  }

  static LoginFlowManager get instance => _instance;

  //url
  final String loginURL = '/iam-external-service/v1/authentication/login';
  final String logoutUrlString =
      '/iam-external-service/v1/authentication/logout';

  Future<LoginModelEntity?> login(String username, String password) async {
    String urlString = APIFlowManager.defaultURLStream + loginURL;
    var url = Uri.parse(urlString);

    var body = {"username": username, "password": password};

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'grant-type': 'password',
      'client-id': APIFlowManager.clientID,
      'client-secret': APIFlowManager.clientSecret
    };

    var response =
        await http.post(url, headers: headers, body: json.encode(body));

    if (response.statusCode < 399) {
      final Map<String, dynamic> jsonParser = json.decode(response.body);
      final data = LoginModelEntity.fromJson(jsonParser);
      return data;
    } else {
      throw Exception('login failed');
    }
  }
}
