import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/loginPage.dart';
import 'package:instagram/screens/registerPage_controller.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 96,
                height: 100,
              ),
              Text(
                "Instagram",
                style: TextStyle(color: Colors.black, fontFamily: 'insta', fontSize: 50),
              ),
              SizedBox(
                height: 60,
              ),
              buildTextField(
                "Email",
                Icons.email,
                    (value) => controller.setEmail(value),
                false,
              ),
              SizedBox(height: 20),
              buildTextField(
                "Username",
                Icons.person,
                    (value) => controller.setUsername(value),
                false,
              ),
              SizedBox(height: 20),
              buildTextField(
                "Bio",
                Icons.info_outline,
                    (value) => controller.setBio(value),
                false,
              ),
              SizedBox(height: 20),
              buildTextField(
                "Password",
                Icons.lock,
                    (value) => controller.setPassword(value),
                true,
              ),
              SizedBox(height: 20),
              buildTextField(
                "Confirm Password",
                Icons.lock,
                    (value) => controller.setPasswordConfirm(value),
                true,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                      () => Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: controller.isPasswordValid ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String hintText,
      IconData icon,
      void Function(String) onChanged,
      bool isPassword,
      ) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          style: TextStyle(fontSize: 18, color: Colors.black),
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
