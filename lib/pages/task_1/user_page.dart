import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_4_tasks/pages/services/hive_service.dart';
import 'package:lesson_6_4_tasks/pages/task_1/account_page.dart';

class UserPageTask1 extends StatefulWidget {
  static const String id = "user_page_task_1";

  const UserPageTask1({Key? key}) : super(key: key);

  @override
  _UserPageTask1State createState() => _UserPageTask1State();
}

class _UserPageTask1State extends State<UserPageTask1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _doLogin(){
    String name = nameController.text.toString().trim();
    String password =passwordController.text.toString().trim();
    HiveDB.storeName(name);
    HiveDB.storePassword(password);
    print(HiveDB.loadName());
    print(HiveDB.loadPassword());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(26, 29, 55, 1),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const SizedBox(height: 50),

                // #avatar
                ClipRRect(
                  child: Image.asset(
                    "assets/images/image_1.jpg",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 25),

                // #title
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
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
                const SizedBox(height: 25),
                Text("Forgot Password?", style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500),),
                const SizedBox(height: 40),

                // #signIn_button
                IconButton(
                  splashRadius: 38,
                  iconSize: 80,
                  onPressed:_doLogin,
                  icon: const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/img.png"),
                    child:  Icon(Icons.arrow_forward, color: Colors.white, size: 40,)),
                ),
              ],
            )),

            // #label_text_signUp
            RichText(
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                      text: "SIGN UP",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushReplacementNamed(context, AccountPageTask1.id);
                      })
                ]))
          ],
        ),
      ),
    );
  }
}
