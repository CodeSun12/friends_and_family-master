import 'package:flutter/material.dart';
import 'package:friends_and_family/screens/auth/login_screen.dart';
import 'package:friends_and_family/screens/utils/shared_prefrence.dart';

class HomeScreen extends StatefulWidget {

 var username, name, phone_number, address, startingDate, subsidyDate, token;
 int? subsidyAmount, subsidyPercentage;

 HomeScreen({
   this.username,
   this.name,
   this.phone_number,
   this.address,
   this.subsidyAmount,
   this.subsidyPercentage,
   this.startingDate,
   this.subsidyDate,
   this.token
 });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Customer Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        actions: [
          IconButton(
            onPressed: (){
              Constants.preferences!.setBool("loggedIn", false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx)=> SignInScreen()));
            },
            icon: Icon(Icons.logout, color: Colors.white, size: 25,),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                    "Username : " + "     " + widget.username,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Name : " + "     " + widget.name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Phone Number : " + "     " + widget.phone_number,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Address : " + "     " + widget.address,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              // const SizedBox(height: 5,),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Subsidy Amount : " + "     " + widget.subsidyAmount.toString(),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              // const SizedBox(height: 5,),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Subsidy Percentage : " + "     " + widget.subsidyPercentage.toString(),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Starting Date : " + "     " + widget.startingDate,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.black38,),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Subsidy Date : " + "     " + widget.subsidyDate,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
