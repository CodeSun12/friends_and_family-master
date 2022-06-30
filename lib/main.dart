import 'package:flutter/material.dart';
import 'package:friends_and_family/screens/provider/cart_provider.dart';
import 'package:friends_and_family/practice/product_screen.dart';
import 'package:friends_and_family/screens/cartScreen.dart';
import 'package:friends_and_family/practice/home_screen.dart';
import 'package:friends_and_family/screens/splash_screen.dart';
import 'package:friends_and_family/screens/utils/shared_prefrence.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'practice/my_home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "CodeBase Task",
        home: Constants.preferences!.getBool("loggedIn") == true
            ? CartScreen()
            : SplashScreen(),
        //     home: MyPractice(),
      ),
    );
  }
}

