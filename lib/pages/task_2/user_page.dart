import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_4_tasks/models/user_model.dart';
import 'package:lesson_6_4_tasks/pages/services/hive_service.dart';
import 'package:lesson_6_4_tasks/pages/task_2/account_page.dart';

class UserPageTask2 extends StatefulWidget {
  static const String id = "user_page_task_2";
  const UserPageTask2({Key? key}) : super(key: key);

  @override
  _UserPageTask2State createState() => _UserPageTask2State();
}

class _UserPageTask2State extends State<UserPageTask2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password =passwordController.text.toString().trim();
    HiveDB.storeUser(User(email: email, password: password));
    print(HiveDB.loadUser().toJson());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(7, 127, 123,1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40,right: 40, bottom: 50, top:70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // #avatar
                ClipRRect(
                  child: Image.asset("assets/images/image_2.jpg", height: 50,  width: 50, fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(60),
                ),
                const SizedBox(height: 30,),
                // #title
                const Text("Welcome", style: TextStyle(color:  Color.fromRGBO(15,137,133,1), fontSize: 18)),
                const SizedBox(height: 5,),
                const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w500),)
              ],
            ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height-265,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.08),

                  // #email_field
                  Text("Email", style: TextStyle(color: Colors.grey.shade800, fontSize: 20),),
                  TextField(
                    controller: emailController,
                    style: TextStyle(
                        color: Colors.grey.shade700, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.055),

                  // #password_field
                  Text("Password", style: TextStyle(color: Colors.grey.shade800, fontSize: 20),),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.grey.shade700, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      hintText: "Enter password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300),),
                  ),

                  // #forgot_password
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Forget Password?", style: TextStyle(color: Colors.grey.shade300, fontSize: 18),),
                  ),

                  // #signIn_button
                  MaterialButton(onPressed: _doLogin,
                      color: const Color.fromRGBO(7, 127, 123,1),
                      minWidth: double.infinity,
                      height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: Colors.grey.shade300
                            )
                          ),
                        ),
                      ),
                      
                      Expanded(
                          flex: 1,child: Text("OR", textAlign:TextAlign.center,style: TextStyle(color: Colors.grey.shade300, fontSize: 16),)),

                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: Colors.grey.shade300
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // #social_accounts
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(child: Image.asset("assets/images/facebook.png", height: 15, width: 15, fit: BoxFit.scaleDown,)),
                        GestureDetector(child: Image.asset("assets/images/twitter.png", height: 25, width: 25,fit: BoxFit.cover)),
                        GestureDetector(child: Image.asset("assets/images/instagram.png", height: 20, width: 20, fit: BoxFit.cover)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 45,),

                  // #label_text_signUp
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                  text: "Sign up",
                                  style: const TextStyle(color: Color.fromRGBO(7, 127, 123,1),),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.pushReplacementNamed(context, AccountPageTask2.id);
                                  })
                            ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
