import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_6_4_tasks/pages/home_page.dart';
import 'package:lesson_6_4_tasks/pages/services/hive_service.dart';
import 'package:lesson_6_4_tasks/pages/task_1/account_page.dart';
import 'package:lesson_6_4_tasks/pages/task_1/user_page.dart';
import 'package:lesson_6_4_tasks/pages/task_2/account_page.dart';
import 'package:lesson_6_4_tasks/pages/task_2/user_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveDB.DB_NAME);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent, systemNavigationBarContrastEnforced: false));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        UserPageTask1.id: (context) => const UserPageTask1(),
        AccountPageTask1.id: (context) => const AccountPageTask1(),
        UserPageTask2.id: (context) => const UserPageTask2(),
        AccountPageTask2.id: (context) => const AccountPageTask2(),
      },
    );
  }
}
