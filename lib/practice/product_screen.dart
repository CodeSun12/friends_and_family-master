// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'model/ProductModel.dart';
// import 'package:http/http.dart' as http;
//
// class ComplexJsonApiCallScreen extends StatefulWidget {
//   var token;
//   ComplexJsonApiCallScreen({this.token});
//
//   @override
//   _ComplexJsonApiCallScreenState createState() => _ComplexJsonApiCallScreenState();
// }
//
// class _ComplexJsonApiCallScreenState extends State<ComplexJsonApiCallScreen> {
//
//   // Creating a List of UserModel
//   List<ProductModel> userList = [];
//
//   Future <List<ProductModel>> getUserApi()async{
//     final response = await http.get(
//         Uri.parse('http://192.168.1.9:8000/api/products/'),
//       headers: {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Accept': 'application/json',
//         'Authorization': 'Token ${widget.token}'
//       },
//     );
//     var data = jsonDecode(response.body.toString());
//     if(response.statusCode == 200){
//       for(Map i in data){
//         userList.add(ProductModel.fromJson(i));
//         // If you simple want to print one simple value then try this
//         print(i['name']);
//       }
//       return userList;
//     }
//     else{
//       return userList;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("Complex Json Api Call"),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(
//                 future: getUserApi(),
//                 builder: (context, AsyncSnapshot<List<ProductModel>> snapshot){
//                   if(!snapshot.hasData){
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   else{
//                     return ListView.builder(
//                       itemCount: userList.length,
//                       itemBuilder: (context, index){
//                         return Card(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 ReusableRow(
//                                   title: "Name",
//                                   value: userList[index].id.toString(),
//                                 ),
//                                 ReusableRow(
//                                   title: "Username",
//                                   value: userList[index].name.toString(),
//                                 ),
//                                 ReusableRow(
//                                   title: "Email",
//                                   value: userList[index].name.toString(),
//                                 ),
//                                 ReusableRow(
//                                     title: "Address",
//                                     value: userList[index].weight.toString()
//                                         + userList[index].price.toString()
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             )
//           ],
//         )
//     );
//   }
// }
//
// class ReusableRow extends StatelessWidget {
//   String? title;
//   String? value;
//   ReusableRow({this.title, this.value});
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title!),
//           Text(value!),
//         ],
//       ),
//     );
//   }
// }
