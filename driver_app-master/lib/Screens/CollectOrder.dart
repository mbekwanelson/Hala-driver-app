import 'package:driverapp/Models/Customer.dart';
import 'package:driverapp/Screens/ArrivedScreen.dart';
import 'package:driverapp/Screens/MyHomePage.dart';
import 'package:driverapp/Shared/Database.dart';
import 'package:driverapp/States/CollectOrderState.dart';
import 'package:driverapp/States/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectOrder extends StatefulWidget {
  Customer customer;
  CollectOrder({this.customer});

  @override
  _CollectOrderState createState() => _CollectOrderState();
}

class _CollectOrderState extends State<CollectOrder> {
  Customer currentCustomer;

  getCurrentOrder(List<Customer> customers){
    for(Customer customer in customers){
      if(customer.custId == widget.customer.custId){
        setState(() {
          currentCustomer = customer;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<List<Customer>>(context);


    if(customers==null && currentCustomer==null) {
      return Scaffold(
          body:Container(
            child: Text(
                "Nothing yet"
            ),
          ));
    }
    else {
      setState(() {
        getCurrentOrder(customers);
      });
      return Scaffold(
          appBar: AppBar(
            title: Text("Order"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                            "Shop: ${currentCustomer.shop}" ?? "",
                            style: TextStyle(
                                fontSize: 30
                            )
                        ),
                        SizedBox(
                            height: 40
                        ),
                        Text(
                            "Order number: ${currentCustomer.orderNumber}",
                            style: TextStyle(
                                fontSize: 30
                            )
                        )

                      ],

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: FlatButton(
                  child: Text(
                      "Order Collected",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  color: Colors.green,
                  onPressed: () async {
                    await CollectOrderState().orderCollected(
                        widget.customer.custId, widget.customer.orderNames);
                    setState(() {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ArrivedScreen(
                                    customer: widget.customer,

                                  )
                            // ChangeNotifierProvider.value(
                            //   value:AppState(),
                            // //   child: MyHomePage(
                            // //   title: "Deliver",
                            // //   custId: widget.customer.custId,
                            // //   customer: widget.customer,
                            // // )
                            //
                            //   child:
                            //
                            // )
                          )
                      );
                    });
                  },
                ),
              )
            ],

          )
      );
    }
  }
}
