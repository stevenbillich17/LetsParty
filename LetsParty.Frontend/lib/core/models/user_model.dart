class UserModel {

  UserModel.allFields({required this.name, this.email, this.birthday});

  UserModel(this.name, this.birthday);

  String? name;
  String? email;
  String? birthday;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.allFields(
      name :json['name'],
      email: json['email'],
      birthday: json['birthday'],
    );
  }

}