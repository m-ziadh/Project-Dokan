import 'package:flutter/material.dart';

const kFillBoxDesign = InputDecoration(
  hintText: 'Enter Value',
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);
