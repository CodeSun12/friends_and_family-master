import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friends_and_family/screens/provider/cart_provider.dart';
import 'package:friends_and_family/checkout_screen.dart';
import 'package:friends_and_family/db_helper.dart';
import 'package:friends_and_family/screens/utils/shared_prefrence.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/ProductModel.dart';
import '../my_drawer.dart';
import 'auth/login_screen.dart';

class CartScreen extends StatefulWidget {
  var token;
  CartScreen({this.token});

  @override
  _CartScreenState createState() => _CartScreenState();
}

// var data;
//
// Future<void> getPostApi() async{
//   final response = await http.get(
//       Uri.parse('http://192.168.1.9:8000/api/products/'),
//     headers: {
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Accept': 'application/json',
//       'Authorization': 'Token 4128421bbeccdec2d374db1fb74df6cf90b51308'
//     },
//   );
//   data = jsonDecode(response.body);
//   if (response.statusCode == 200){
//     print("Successfully Get Data");
//     print(data);
//   }else{
//     print("Failed");
//   }
//   return data;
// }

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  var data;

  Future<void> getPostApi() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.9:8000/api/products/'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Token ${widget.token}'
      },
    );
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Successfully Get Data");
      print(data);
    } else {
      print("Failed");
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(child: Text("Product List")),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()));
              },
              child: Center(
                child: Badge(
                  showBadge: true,
                  badgeContent: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return const Text("0",
                          style: TextStyle(color: Colors.white));
                    },
                  ),
                  animationType: BadgeAnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {
                  Constants.preferences!.setBool("loggedIn", false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => SignInScreen()));
                },
                icon: const Icon(
                  Icons.logout,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 160,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "ID:  " + data[index]['id'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Item:  " +
                                          data[index]['name'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Weight:  " +
                                          data[index]['weight'].toString() +
                                          " " +
                                          data[index]['uom'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Price:  " +
                                              data[index]['price'].toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        dbHelper!.insert(
                                            Cart(
                                                id: index,
                                                productName: data[index]['name'].toString(),
                                                initialPrice: data[index]['price'].toString(),
                                                quantity: 1,
                                                unitTag: data[index]['uom'].toString(),
                                                weight: data[index]['weight'].toString(),
                                            )
                                        )
                                            .then((value) {
                                          cart.addTotalPrice(double.parse(
                                              data[index]['price'].toString()));
                                          cart.addCounter();

                                          final snackBar =  SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                'Product is added to cart'),
                                            duration: Duration(seconds: 1),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }).onError((error, stackTrace) {
                                          print("error" + error.toString());
                                          final snackBar =  SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'Product is already added in cart'),
                                              duration: Duration(seconds: 1));

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        });
                                      },
                                      color: Colors.deepPurple.shade400,
                                      child: const Text(
                                        "Add To Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ],
        ));
  }
}
