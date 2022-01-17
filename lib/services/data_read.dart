import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class DataRetriever {
  Future<dynamic> getData() async {
    var data = await rootBundle.loadString('jasonFile/response.json');
    List jsonData = json.decode(data);
    return jsonData;
  }
}
