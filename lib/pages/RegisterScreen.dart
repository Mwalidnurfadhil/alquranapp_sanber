import 'package:final_project_alquranapp/controller/authController.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController authC = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
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
                    'Register',
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
                onTap: () => authC.signup(
                    _emailController.text, _passwordController.text),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF00695C),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'SIGN UP',
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
                  Get.toNamed(RouteName.LOGIN);
                },
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Have an account',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                        TextSpan(
                            text: '  LOG IN',
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
