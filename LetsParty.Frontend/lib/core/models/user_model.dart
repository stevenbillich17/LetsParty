import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class UserModel {

  UserModel.allFields(this.name, this.email, this.birthday);

  UserModel(this.name, this.birthday);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  @JsonKey()
  String? name;
  String? email;
  @JsonKey()
  String? birthday;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}