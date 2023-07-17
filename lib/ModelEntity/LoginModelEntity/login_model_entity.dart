import 'package:VPRO/ModelEntity/base_model_entity.dart';

class LoginModelEntity extends BaseModelEntity {
  LoginTokenEntity? data;

  LoginModelEntity(
      {this.data,
      int? code,
      required int status,
      bool? successful,
      String? exception})
      : super(
            code: code,
            status: status,
            successful: successful,
            exception: exception);

  LoginModelEntity.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? LoginTokenEntity.fromJson(json['data']) : null;

    status = json['status'];
    code = json['code'];
    exception = json['exception'];
    successful = json['successful'];
  }
}

class LoginTokenEntity {
  String? token;
  int? exp;

  LoginTokenEntity({this.token, this.exp});

  LoginTokenEntity.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    exp = json['exp'];
  }
}
