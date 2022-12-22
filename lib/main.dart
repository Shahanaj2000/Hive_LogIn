import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_login/db/models/data_models.dart';
import 'package:hive_login/db/screens/login_signup.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LogInSignUp(),
    );
  }
}