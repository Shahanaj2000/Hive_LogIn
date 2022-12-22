import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_login/db/screens/login.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  //! Controllers
  final _emailControllers = TextEditingController();
  final _passwordControllers = TextEditingController();
  final _conformPasswordControlllers = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                "SignUp",
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
                controller: _emailControllers,
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
                controller: _passwordControllers,
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

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _conformPasswordControlllers,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                  labelText: 'ConformPassword',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),

            //! Elevated Button
            ElevatedButton(
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
                  Get.to(() => SignUpScreen());
                },
                child: const Text(
                  "SignUp", 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('Already have an account?'),
                   TextButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}