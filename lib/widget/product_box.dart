import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  final String link;
  final String productname;
  final String price;
  final String regularprice;
  ProductBox(
      {required this.link,
      required this.productname,
      required this.price,
      required this.regularprice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: [
          Container(
            height: 125.0,
            child: Image.network(
              link,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              alignment: Alignment.center,
              child: Text(
                productname,
                style: const TextStyle(
                  fontSize: 18.5,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10.0),
              Text(
                '\$ $regularprice',
                style: const TextStyle(
                  fontSize: 13.5,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(width: 15.0),
              Text(
                '\$ $price',
                style: const TextStyle(
                  fontSize: 17.5,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
