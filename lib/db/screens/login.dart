
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_login/db/functions/data_fucnctions.dart';
import 'package:hive_login/db/models/data_models.dart';
import 'package:hive_login/db/screens/home_Screen.dart';
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
                onPressed: () async {
                  //Get.to(() => LoginScreen());
                  final list = await DBFunctions.instance.getUsers();
                  checkUser(list);
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

  // TODO CheckUser
Future<void> checkUser(List<UserModel> userList) async {  

  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();

  bool isUserFound = false;

  final isValidated = await validateLogin(email, password);

  if (isValidated == true) {
    await Future.forEach(userList, (user) {
      if (user.email == email && user.password == password) {
        isUserFound = true;
      } else {
        isUserFound = false;
      }
    });

    if (isUserFound == true) {
      Get.offAll(() => HomeScreen(email: email));
      Get.snackbar('Success', 'LoggedIn as $email');
    } 
      
    else {
      Get.snackbar(
        'Error', 'Incorrect email oe password',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }

   /*  else {
      Get.snackbar(
        'Error', 'Feilds cannot be empty',
         colorText: Colors.red,
         backgroundColor: Colors.white,

      );
    } */ 

  }
}
  //! VlidateLogIn
  Future<bool> validateLogin(String email, String password) async {
      if (email != '' && password != '') {
        return true;
      } else {
        return false;
      }
  }
}


