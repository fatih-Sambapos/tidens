import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  int? s;
  int? i;
  int? t;
  String? m;

  LoginModel({this.s, this.i, this.t, this.m});

  factory LoginModel.fromJson(Map<String, dynamic> data) =>
      _$LoginModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
