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
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png",
                  fit: BoxFit.cover,
                  height: 250,
              ),
              Text(
                "Wellcome $name",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                        ),
                        onChanged: (value){
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),

                      InkWell(
                        onTap: () async{
                          setState(() {
                            changeButton = true;
                          });
                          await Future.delayed(const Duration(seconds: 1));
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: changeButton
                              ?BoxShape.circle
                              :BoxShape.rectangle,
                            //borderRadius: BorderRadius.circular(changeButton? 20:8),
                        ),
                          child:  const Text(
                            "Login",
                            style: TextStyle(color: Colors.yellowAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),




                        ),
                      ),

                      /*ElevatedButton(

                        style: TextButton.styleFrom(minimumSize: const Size(150, 45),
                        backgroundColor: Colors.red),
                        child: const Text("Login"),
                        onPressed: (){
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },

                      )*/
                    ],
                  )

              )

            ],
          ),
        ));
  }
}
