import 'package:flutter/material.dart';

abstract class BaseModelEntity {
  int? status;
  int? code;
  String? exception;
  bool? successful;

  BaseModelEntity({this.code, this.exception, this.status, this.successful});
}
