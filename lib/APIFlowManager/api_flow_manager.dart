import 'package:flutter/material.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class APIFlowManager {
  static const defaultHosting = "https://mt.vietcap.com.vn";
  static const defaultURLStream = "https://mt.vietcap.com.vn/api";

  //Client ID only hard code for IOS client
  static const clientID = "6657c2b1-f825-4691-b2d7-c9b84c1d2155";
  static const clientSecret = "N3RkVZ71PuT6F1L";
  static const environmentType = "qc";
}
