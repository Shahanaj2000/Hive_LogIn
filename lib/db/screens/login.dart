
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_login/db/screens/signup.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({super.key});

  //TODo Controllors
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                "LogIn",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //! For TextFeild
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),

            //! Elevated Button

            Padding(
              padding: const EdgeInsets.all(20.0),
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
                child: const Text('LOGIN'),
              ),
            ),

            TextButton(
              onPressed: () {
                Get.to(() => SignUpScreen());
              },
              child: const Text('Not a User? Register Here!'),
            ),
          ],
        ),
      ),
    );
  }
}