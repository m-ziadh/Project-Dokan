import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'Pages/product.dart';
import 'Pages/profile.dart';
import 'Pages/registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Dokan());
}

class Dokan extends StatelessWidget {
  const Dokan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'loginScr',
      routes: {
        'loginScr': (context) => LoginPage(),
        'registerScr': (context) => RegisterPage(),
        'productScr': (context) => ProductPage(),
        'profileScr': (context) => ProfilePage(),
      },
    );
  }
}
