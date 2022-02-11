import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_4_tasks/pages/task_1/user_page.dart';

import '../services/hive_service.dart';

class AccountPageTask1 extends StatefulWidget {
  static const String id = "account_page_task_1";
  const AccountPageTask1({Key? key}) : super(key: key);

  @override
  _AccountPageTask1State createState() => _AccountPageTask1State();
}

class _AccountPageTask1State extends State<AccountPageTask1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _doSignUp(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password =passwordController.text.toString().trim();
    HiveDB.storeName(name);
    HiveDB.storeEmail(email);
    HiveDB.storePhone(phone);
    HiveDB.storePassword(password);
    print(HiveDB.loadName());
    print(HiveDB.loadEmail());
    print(HiveDB.loadPhone());
    print(HiveDB.loadPassword());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 29, 55, 1),
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: ()async{
            Navigator.pushReplacementNamed(context, UserPageTask1.id);
            return false;
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    // #title
                    Text(
                      "Create\nAccount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      height: 40,
                    ),

                    // #name_field
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            hintText: "User Name",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(CupertinoIcons.person,
                                color: Colors.grey.shade400, size: 22)),
                      ),
                    ),

                    // #email_field
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(CupertinoIcons.mail,
                                color: Colors.grey.shade400, size: 22)),
                      ),
                    ),

                    // #phone_field
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(CupertinoIcons.phone,
                                color: Colors.grey.shade400, size: 22)),
                      ),
                    ),

                    // #password_field
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 14),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(CupertinoIcons.lock,
                                color: Colors.grey.shade400, size: 22)),
                      ),
                    ),
                    const SizedBox(height: 65),

                    // #signUp_button
                    IconButton(
                      splashRadius: 38,
                      iconSize: 80,
                      onPressed: _doSignUp,
                      icon: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/images/img.png"),
                          child:  Icon(Icons.arrow_forward, color: Colors.white, size: 40,)),
                    ),
                  ],
                ),
                const SizedBox(height: 70,),

                // #label_text_signIn
                RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: "SIGN IN",
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.pushReplacementNamed(context, UserPageTask1.id);
                              })
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
