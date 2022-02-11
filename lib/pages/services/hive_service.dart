import 'package:hive/hive.dart';
import 'package:lesson_6_4_tasks/models/account_model.dart';

import '../../models/user_model.dart';

class HiveDB{
  static String DB_NAME = "lesson 6_4";
  static var box = Hive.box(DB_NAME);

  static void storeName(String name) async{
    box.put("name", name);
  }

  static String loadName(){
    return box.get("name");
  }

  static removeName(){
    box.delete("name");
  }

  static void storePassword(String password) async{
    box.put("password", password);
  }

  static String loadPassword(){
    return box.get("password");
  }

  static removePassword(){
    box.delete("password");
  }

  static void storeEmail(String email) async{
    box.put("email", email);
  }

  static String loadEmail(){
    return box.get("email");
  }

  static removeEmail(){
    box.delete("email");
  }

  static void storePhone(String phone) async{
    box.put("phone", phone);
  }

  static String loadPhone(){
    return box.get("phone");
  }

  static removePhone(){
    box.delete("phone");
  }

  static void storeUser(User user){
    box.put("user", user.toJson());
  }
  static User loadUser(){
    return User.fromJson(box.get("user"));
  }

  static removeUser(){
    box.delete("user");
  }

  static void storeAccount(Account account){
    box.put("account", account.toJson());
  }
  static Account loadAccount(){
    return Account.fromJson(box.get("account"));
  }

  static removeAccount(){
    box.delete("account");
  }
}