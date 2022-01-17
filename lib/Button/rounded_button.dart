import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function doIt;

  RoundedButton({required this.title, required this.doIt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Material(
        elevation: 5.0,
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: () {
            doIt();
          },
          minWidth: 350.0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
