import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lesson_6_4_tasks/models/account_model.dart';
import 'package:lesson_6_4_tasks/pages/task_2/user_page.dart';

import '../services/hive_service.dart';

class AccountPageTask2 extends StatefulWidget {
  static const String id = "account_page_task_2";
  const AccountPageTask2({Key? key}) : super(key: key);

  @override
  _AccountPageTask2State createState() => _AccountPageTask2State();
}

class _AccountPageTask2State extends State<AccountPageTask2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void _doSignUp(){
    String email = emailController.text.toString().trim();
    String phone =phoneController.text.toString().trim();
    String address =addressController.text.toString().trim();
    HiveDB.storeAccount(Account(email: email, phone: phone, address: address));
    print(HiveDB.loadAccount().toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 127, 123,1),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.pushReplacementNamed(context, UserPageTask2.id);
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // #title
              Container(
                margin: const EdgeInsets.only(left: 40,right: 40, bottom: 50, top:70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Welcome", style: TextStyle(color:  Color.fromRGBO(15,137,133,1), fontSize: 18)),
                    SizedBox(height: 5,),
                    Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w500),)
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height-185,
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
                    SizedBox(height: MediaQuery.of(context).size.height*0.05),

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
                    SizedBox(height: MediaQuery.of(context).size.height*0.05),

                    // #number_field
                    Text("Number", style: TextStyle(color: Colors.grey.shade800, fontSize: 20),),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
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
                        hintText: "Enter number",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade300),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05),

                    // #address_field
                    Text("Address", style: TextStyle(color: Colors.grey.shade800, fontSize: 20),),
                    TextField(
                      controller: addressController,
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
                        hintText: "Enter address",
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

                    // #signUp_button
                    MaterialButton(onPressed: _doSignUp,
                      color: const Color.fromRGBO(7, 127, 123,1),
                      minWidth: double.infinity,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                    const SizedBox(height: 20,),

                    // #social_accounts
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

                    // #label_text_sign_in
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: "Sign in",
                                    style: const TextStyle(color: Color.fromRGBO(7, 127, 123,1),),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Navigator.pushReplacementNamed(context, UserPageTask2.id);
                                    })
                              ])),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
