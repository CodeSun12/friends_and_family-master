import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'screens/provider/cart_provider.dart';
import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'model/ProductModel.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Shopping Cart'),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value , child){
                  return Text(value.getCounter().toString(),style: const TextStyle(color: Colors.white));
                },
              ),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
          const SizedBox(width: 20.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder(
                future:cart.getData() ,
                builder: (context , AsyncSnapshot<List<Cart>> snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data!.isEmpty){
                      return Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Text('Your cart is empty 😌' ,style: Theme.of(context).textTheme.headline5),
                            const SizedBox(height: 20,),
                            Text('Explore products and shop your\nfavourite items' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.subtitle2)
                          ],
                        ),
                      );
                    }
                    else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const SizedBox(width: 10,),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(snapshot.data![index].id.toString() ,
                                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                    ),
                                                    Text(snapshot.data![index].productName.toString() ,
                                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                    ),
                                                    InkWell(
                                                        onTap: (){
                                                          dbHelper!.delete(snapshot.data![index].id!);
                                                          cart.removerCounter();
                                                          cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                                                          cart.removeFinalTotalPrice();
                                                        },
                                                        child: const Icon(Icons.delete))
                                                  ],
                                                ),

                                                const SizedBox(height: 5,),
                                                Text(snapshot.data![index].weight.toString() + " " + snapshot.data![index].unitTag.toString() ,
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                ),
                                                const SizedBox(height: 5,),
                                                Text(snapshot.data![index].initialPrice.toString() + " " + "Rs",
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                ),
                                                const SizedBox(height: 5,),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: (){
                                                    },
                                                    child:  Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: Colors.deepPurple,
                                                          borderRadius: BorderRadius.circular(5)
                                                      ),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            InkWell(
                                                                onTap: (){
                                                                  int quantity =  snapshot.data![index].quantity! ;
                                                                  double price = double.parse(snapshot.data![index].initialPrice!);
                                                                  quantity--;
                                                                  double? newPrice = price * quantity ;

                                                                  if(quantity > 0){
                                                                    dbHelper!.updateQuantity(
                                                                        Cart(
                                                                            id: snapshot.data![index].id!,
                                                                            productName: snapshot.data![index].productName,
                                                                            initialPrice: snapshot.data![index].initialPrice,
                                                                            // productPrice: newPrice.toString(),
                                                                            quantity: quantity,
                                                                            unitTag: snapshot.data![index].unitTag.toString(),
                                                                            weight: snapshot.data![index].weight.toString())
                                                                    ).then((value){
                                                                      newPrice = 0 ;
                                                                      quantity = 0;
                                                                      cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                    }).onError((error, stackTrace){
                                                                      print(error.toString());
                                                                    });
                                                                  }

                                                                },
                                                                child: const Icon(Icons.remove , color: Colors.white,)),
                                                            Text( snapshot.data![index].quantity.toString(), style: const TextStyle(color: Colors.white)),
                                                            InkWell(
                                                                onTap: (){
                                                                  int quantity =  snapshot.data![index].quantity! ;
                                                                  double price = double.parse(snapshot.data![index].initialPrice!);
                                                                  quantity++;
                                                                  double? newPrice = price * quantity ;

                                                                  dbHelper!.updateQuantity(
                                                                      Cart(
                                                                          id: snapshot.data![index].id,
                                                                          productName: snapshot.data![index].productName,
                                                                          initialPrice: snapshot.data![index].initialPrice,
                                                                          // productPrice: newPrice.toString(),
                                                                          quantity: quantity,
                                                                          unitTag: snapshot.data![index].unitTag.toString(),
                                                                          weight: snapshot.data![index].weight.toString())
                                                                  ).then((value){
                                                                    newPrice = 0 ;
                                                                    quantity = 0;
                                                                    cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                  }).onError((error, stackTrace){
                                                                    print(error.toString());
                                                                  });
                                                                },
                                                                child: const Icon(Icons.add , color: Colors.white,)),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }

                  }
                  return const Text('') ;
                }),
            Consumer<CartProvider>(builder: (context, value, child){
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                child: Column(
                  children: [
                    ReusableWidget(title: 'Sub Total', value: value.getTotalPrice().toStringAsFixed(2) + " " + r"Rs",),
                    ReusableWidget(title: 'Discout 25%', value: value.getFinalTotalPrice().toStringAsFixed(2) + " " + r"Rs" ,),
                    ReusableWidget(title: 'Total Bill', value: r'Rs'+value.getTotalBill().toStringAsFixed(2),)
                  ],
                ),
              );
            }),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0XFF6A62B7),
                          Colors.deepPurple
                        ]
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Order Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ) ,
    );
  }
}


class ReusableWidget extends StatelessWidget {
  final String title , value ;
   const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title , style: Theme.of(context).textTheme.subtitle2,),
              Text(value.toString() , style: Theme.of(context).textTheme.subtitle2,),
            ],
          ),
        ),
      ],
    );
  }
}