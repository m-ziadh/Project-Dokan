import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_dokan/Button/rounded_button.dart';
import 'package:project_dokan/Constants/text_constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/Dokan.png'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
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
                        icon: Icon(Icons.email),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      cursorColor: Colors.deepOrange,
                      cursorHeight: 20,
                      decoration: kFillBoxDesign.copyWith(
                        hintText: "Password",
                        icon: Icon(Icons.lock_open),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: RoundedButton(
                  doIt: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      await Navigator.pushNamed(context, 'productScr');
                    } catch (e) {
                      setState(() {
                        Alert(
                                context: context,
                                title: "Failed",
                                desc: "Please Register For Account",
                                type: AlertType.error)
                            .show();
                      });
                    }
                  },
                  title: 'Login',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('images/Facebook.jpg'),
                      height: 40.0,
                      width: 40.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      child: Image.asset('images/Google.jpg'),
                      height: 40.0,
                      width: 40.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, 'registerScr');
                    });
                  },
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
