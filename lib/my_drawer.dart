import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
              ),
              accountName: Text("Shakeeb Khan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),),
              accountEmail: Text("Shakeebsun@gmail.com", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          ),
           Divider(thickness: 1.5, color: Colors.grey,),
          SizedBox(height: 25.0,),
          ListTile(
            leading: Icon(Icons.phone_android_outlined, color: Colors.white,),
            title: Text("+923147896819", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: Icon(Icons.location_on_outlined, color: Colors.white,),
            title: Text("Chungi No:21 Multan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: Icon(Icons.family_restroom, color: Colors.white,),
            title: Text("4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white,),
            title: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),),
          ),
        ],
      ),
    );
  }
}
