import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_login/db/functions/data_fucnctions.dart';
import 'package:hive_login/db/models/data_models.dart';
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
                  //Get.to(() => SignUpScreen());
                  validateSignup();
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

  //! Vlidate SignUp
  Future<void> validateSignup() async {

    final emial = _emailControllers.text.trim();
    final password = _passwordControllers.text.trim();
    final confirmPassword = _conformPasswordControlllers.text.trim();

    final isEmailValidated = EmailValidator.validate(emial);

    if (emial != '' && password != '' && confirmPassword != '') {
      if (isEmailValidated == true) {
        final isPasswordValidate = checkPassword(emial, confirmPassword);
        if (isPasswordValidate == true) {
          final user = UserModel(email: emial, password: password);
          await DBFunctions.instance.userSignup(user);
          Get.back();
          Get.snackbar('Success', 'Account created');

          print('Success');
        } 
      } else {
          Get.snackbar(
            'Error', 'Please provide a valid email',
            colorText: Colors.red,
            backgroundColor: Colors.white,
          );
      } /*else {
          'Error', 'Fielde Cannot be empty',
           colorText: Colors.red,
           backgroundColor: Colors.white,
    } */
  }
}

      bool checkPassword(String pass, String confPpass) {
        if (pass == confPpass) {
          if (pass.length < 6) {
            Get.snackbar(
              'Error', 'Password must contain 6 characters or more',
              colorText: Colors.red,
              backgroundColor: Colors.white,
            );
            return false;
          } else {
            return true;
          }    
        } else {
          Get.snackbar(
            'Password mismatch', 'Password and Confirm password are not same',
            colorText: Colors.red,
            backgroundColor: Colors.white,
          );
          return false;
        }
      }
    }
  
