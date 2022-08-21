import 'dart:ffi';

import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context){
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_img.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Username should not be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          name = value;
                          setState((){});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "password should not be empty";
                          }
                          else if(value.length < 6) {
                            return "password length should not be less than 6 letters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),

                      Material(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(changeButton? 20 : 8),
                        child: InkWell(
                          onTap: ()  => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton? 50 : 150,
                            height: 40,

                            alignment: Alignment.center,
                            child: changeButton? const Icon(Icons.done,color: Colors.white,):
                            const Text(
                              "Login", style: TextStyle(
                              color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: const Text("Login"),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}