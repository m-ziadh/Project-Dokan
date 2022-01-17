import 'package:flutter/material.dart';
import 'package:project_dokan/services/data_read.dart';
import 'package:project_dokan/widget/product_box.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var sort = 'Sort By';
  late List jsonData;
  List<Widget> product = [];

  //For Sorting
  List<String> Slink = [];
  List<String> Sname = [];
  List<String> Sprice = [];
  List<String> SrPrice = [];

  @override
  void initState() {
    setState(() {
      dataProcess();
    });
    super.initState();
  }

  void dataProcess() async {
    DataRetriever dr = DataRetriever();
    jsonData = await dr.getData();
    for (int i = 0; i < jsonData.length; i++) {
      String Jlink = jsonData[i]['images'][0]['src'];
      String Jname = jsonData[i]['name'];
      String Jprice = jsonData[i]['price'] != '' ? jsonData[i]['price'] : '0.0';
      String Jregularprice = jsonData[i]['regular_price'] != ''
          ? jsonData[i]['regular_price']
          : '0.0';

      setState(() {
        product.add(
          ProductBox(
              link: Jlink,
              productname: Jname,
              price: Jprice,
              regularprice: Jregularprice),
        );
      });

      //For Sorting
      Slink.add(Jlink);
      Sname.add(Jname);
      Sprice.add(Jprice);
      SrPrice.add(Jregularprice);
    }
  }

  List<Widget> Sort(String type) {
    List<Widget> Tproduct = [];
    if (type == 'Price: Low -> High') {
      for (int i = 0; i < product.length - 1; i++) {
        for (int j = i + 1; j < product.length; j++) {
          if (int.parse(Sprice[i]) > int.parse(Sprice[j])) {
            String tempL = Slink[i];
            Slink[i] = Slink[j];
            Slink[j] = tempL;
            String tempN = Sname[i];
            Sname[i] = Sname[j];
            Sname[j] = tempN;
            String tempP = Sprice[i];
            Sprice[i] = Sprice[j];
            Sprice[j] = tempP;
            String tempRP = SrPrice[i];
            SrPrice[i] = SrPrice[j];
            SrPrice[j] = tempRP;
          }
        }
      }
    } else if (type == 'Price: High -> Low') {
      for (int i = 0; i < product.length - 1; i++) {
        for (int j = i + 1; j < product.length; j++) {
          if (int.parse(Sprice[i]) < int.parse(Sprice[j])) {
            String tempL = Slink[i];
            Slink[i] = Slink[j];
            Slink[j] = tempL;
            String tempN = Sname[i];
            Sname[i] = Sname[j];
            Sname[j] = tempN;
            String tempP = Sprice[i];
            Sprice[i] = Sprice[j];
            Sprice[j] = tempP;
            String tempRP = SrPrice[i];
            SrPrice[i] = SrPrice[j];
            SrPrice[j] = tempRP;
          }
        }
      }
    } else {
      return product;
    }
    for (int i = 0; i < product.length; i++) {
      Tproduct.add(
        ProductBox(
            link: Slink[i],
            productname: Sname[i],
            price: Sprice[i],
            regularprice: SrPrice[i]),
      );
    }
    return Tproduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.search,
          color: Colors.deepOrangeAccent,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              hint: Text(
                sort,
                style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 14.0,
                ),
              ),
              underline: Container(
                height: 1,
                color: Colors.deepOrangeAccent,
              ),
              icon: const Icon(
                Icons.sort,
                color: Colors.deepOrangeAccent,
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepOrangeAccent),
              onChanged: (v) {
                sort = v!;
                setState(() {
                  product = Sort(v);
                });
              },
              items: <String>[
                'Price: Low -> High',
                'Price: High -> Low',
                'Best Match',
                'Best Seller'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
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
              onPressed: () {
                Navigator.pushNamed(context, 'profileScr');
              },
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
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: product,
        ),
      ),
    );
  }
}
