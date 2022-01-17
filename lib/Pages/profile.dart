import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_dokan/Button/rounded_button.dart';
import 'package:project_dokan/Constants/text_constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User loggedUser = FirebaseAuth.instance.currentUser!;
  String name = 'weDev';
  String email = 'xyz@email.com';

  @override
  void initState() {
    setState(() {
      email = loggedUser.email!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 10.0),
            IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 80.0),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 10.0),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                child: Text(
                  'My Account',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picjumbo.com/wp-content/uploads/alone-with-his-thoughts-1080x720.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 22.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 12.5,
                  ),
                ),
              ),
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                shadowColor: Colors.deepOrangeAccent,
                margin: EdgeInsets.all(8),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ExpansionTile(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.account_box,
                          color: Colors.deepOrangeAccent,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Personal Info',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "Full Name",
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "Address",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "Address",
                          ),
                        ),
                      ),
                      RoundedButton(
                        doIt: () {},
                        title: 'Save',
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                shadowColor: Colors.deepOrangeAccent,
                margin: EdgeInsets.all(8),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ExpansionTile(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.lock_open,
                          color: Colors.deepOrangeAccent,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Update Password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          obscureText: true,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "Current Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          obscureText: true,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "New Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          cursorColor: Colors.deepOrange,
                          obscureText: true,
                          cursorHeight: 20,
                          decoration: kFillBoxDesign.copyWith(
                            hintText: "Confirm Password",
                          ),
                        ),
                      ),
                      RoundedButton(
                        doIt: () {},
                        title: 'Update',
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                shadowColor: Colors.deepOrangeAccent,
                margin: EdgeInsets.all(8),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ExpansionTile(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Colors.deepOrangeAccent,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Under Processing',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                shadowColor: Colors.deepOrangeAccent,
                margin: EdgeInsets.all(8),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ExpansionTile(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.deepOrangeAccent,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Wishlist',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Under Processing',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                doIt: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                title: 'Log Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
