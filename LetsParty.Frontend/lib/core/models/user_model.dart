class UserModel {

  UserModel.allFields(this.name, this.email, this.birthday);

  UserModel(this.name, this.birthday);

  String? name;
  String? email;
  String? birthday;

}