import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_dokan/Button/rounded_button.dart';
import 'package:project_dokan/Constants/text_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ImagePicker _picker = ImagePicker();
  var _image;

  late String email;
  late String password;
  late String Cemail;
  late String Cpassword;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: _image != null
                        ? Image.file(
                            _image,
                            fit: BoxFit.fill,
                          )
                        : const Icon(
                            Icons.camera_alt,
                            color: Colors.deepOrangeAccent,
                            size: 40.0,
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                cursorColor: Colors.deepOrange,
                cursorHeight: 20,
                decoration: kFillBoxDesign.copyWith(
                  hintText: "Email",
                  icon: const Icon(Icons.email),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                cursorColor: Colors.deepOrange,
                cursorHeight: 20,
                decoration: kFillBoxDesign.copyWith(
                  hintText: "Confirm Email",
                  icon: const Icon(Icons.email),
                ),
                onChanged: (value) {
                  Cemail = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.deepOrange,
                cursorHeight: 20,
                decoration: kFillBoxDesign.copyWith(
                  hintText: "Password",
                  icon: const Icon(Icons.lock_open),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.deepOrange,
                cursorHeight: 20,
                decoration: kFillBoxDesign.copyWith(
                  hintText: "Confirm Password",
                  icon: const Icon(Icons.lock_open),
                ),
                onChanged: (value) {
                  Cpassword = value;
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: RoundedButton(
                doIt: () async {
                  try {
                    if (email != Cemail && password != Cpassword) {
                      throw Exception();
                    }
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    setState(() {
                      Alert(
                              context: context,
                              title: "Successful",
                              desc: "Account Registration is Complete",
                              type: AlertType.success)
                          .show();
                    });
                  } catch (e) {
                    setState(() {
                      Alert(
                              context: context,
                              title: "Error",
                              desc: "Something went wrong. Try Again",
                              type: AlertType.error)
                          .show();
                    });
                  }
                },
                title: 'Register',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('images/Facebook.jpg'),
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  child: Image.asset('images/Google.jpg'),
                  height: 40.0,
                  width: 40.0,
                ),
              ],
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already Have an Account?',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
