class Account {
  String email;
  String phone;
  String address;

  Account({required this.email, required this.phone, required this.address});

  Account.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        phone = json["phone"],
        address = json["address"];

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "address": address,
      };
}
