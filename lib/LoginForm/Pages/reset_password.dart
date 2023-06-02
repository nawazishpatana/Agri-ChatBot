// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../uitils/colorList.dart';
import '../uitils/reuseabe.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Required",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email Id", Icons.person_outline,
                      false, "Required", _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(context, "Reset Password", () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    }
                  })
                ],
              ),
            ),
          ))),
    );
  }
}
