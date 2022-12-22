import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_login/db/screens/login.dart';
import 'package:hive_login/db/screens/signup.dart';
class LogInSignUp extends StatefulWidget {
  const LogInSignUp({super.key});

  @override
  State<LogInSignUp> createState() => _LogInSignUpState();
}

class _LogInSignUpState extends State<LogInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                'Hello There!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                "Automatic identity verification which enable you to verify your identity",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey, 
                ),
              ),
            ),

            Image.network('https://t3.ftcdn.net/jpg/03/39/70/90/360_F_339709048_ZITR4wrVsOXCKdjHncdtabSNWpIhiaR7.jpg'),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
               
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade700),
                  minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  )
                ),
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: const Text(
                  "LogIn",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
               
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade700),
                  minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), 
                    ),
                  )
                ),
                onPressed: () {
                 Get.to(() => SignUpScreen());
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}