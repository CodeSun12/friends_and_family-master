import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:friends_and_family/screens/auth/login_screen.dart';
import 'package:friends_and_family/screens/utils/shared_prefrence.dart';
import '../model/CustomerProfileModel.dart';
import 'package:http/http.dart' as http;

class MyHomeScreen extends StatefulWidget {
  var token;
  MyHomeScreen({this.token});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}


class _MyHomeScreenState extends State<MyHomeScreen> {

  final countries = ["hello", "shakeeb", "fazeel"];


  var data;


  Future getPostApi() async{
    final response = await http.get(
      Uri.parse('http://192.168.1.9:8000/api/profile/'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Token 84ac7a0e31efaa1c1af6593cdaed1b1a769f9ede',
      },
    );
    data = jsonDecode(response.body);
    // myData = data;
    if(response.statusCode == 200){
      print("Data get successfully");
      print(data);
      print(data.runtimeType);
    }else{
      print("Failed");
    }
    return data;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Rest Api Get Data"),
            leading: IconButton(
                onPressed: () {
                  getPostApi();
                },
                icon: Icon(Icons.list)),
            actions: [
              IconButton(
                onPressed: () {
                  Constants.preferences!.setBool("loggedIn", false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const SignInScreen()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ]),
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
                          return Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Name : " + "     " + data['name'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Username : " + "     " + data['username'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Family Members : " + "     " + data['family_members'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Phone Number : " + "     " + data['phone_number'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Address : " + "     " + data['address'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Subsidy Amount : " + "     " + data['subsidy_amount'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Subsidy Percentage : " + "     " + data['subsidy_percentage'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Starting Date : " + "     " + data['starting_date'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(thickness: 1.5, color: Colors.black26,),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  "Subsidy Date : " + "     " + data['subsidy_date'].toString(),
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
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
