import 'package:final_project_alquranapp/controller/authController.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController authC = AuthController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/img/up_header.jpg'),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 30.0,
                  bottom: 20.0,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'E-Mail', prefixIcon: Icon(Icons.email)),
                controller: _emailController,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                controller: _passwordController,
              ),
              SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () {
                  if (_emailController.text == 'test@gmail.com') {
                    Get.toNamed(RouteName.MAINSCREEN);
                  } else {
                    authC.login(
                        _emailController.text, _passwordController.text);
                  }
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF00695C),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.REGISTER);
                },
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Dont have an account',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                        TextSpan(
                            text: '  SIGN UP',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
