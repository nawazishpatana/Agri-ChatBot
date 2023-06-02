// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:vimeo/LoginForm/Pages/reset_password.dart';
import 'package:vimeo/LoginForm/Pages/signup_screen.dart';
import 'package:vimeo/widgets/navbar.dart';
import '../uitils/colorList.dart';
import '../uitils/reuseabe.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("347C17"),
          hexStringToColor("006400"),
          hexStringToColor("056608")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Form(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                children: <Widget>[
                  logoWidget("assets/plant_happy.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline,
                      false, "Required", _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      "Required", _passwordTextController),
                  const SizedBox(
                    height: 5,
                  ),
                  forgetPassword(context),
                  firebaseUIButton(context, "Sign In", () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgriChatBot()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }
                  }),
                  signUpOption()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
