import 'package:flutter/material.dart';
import 'package:lesson_6_4_tasks/pages/task_1/user_page.dart';
import 'package:lesson_6_4_tasks/pages/task_2/user_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 6_4"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              Navigator.pushNamed(context, UserPageTask1.id);
            }, color: Colors.blue, minWidth: 150, child: const Text("Task 1", style: TextStyle(color: Colors.white, fontSize: 18),), shape: const StadiumBorder(),),
            const SizedBox(height: 5,),
            MaterialButton(onPressed: (){
              Navigator.pushNamed(context, UserPageTask2.id);
            }, color: Colors.blue,minWidth: 150, child: const Text("Task 2", style: TextStyle(color: Colors.white, fontSize: 18),), shape: const StadiumBorder(),),
          ],
        ),
      ),
    );
  }
}
