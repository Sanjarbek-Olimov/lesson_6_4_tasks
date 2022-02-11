class User{
  String email;
  String password;

  User({required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}