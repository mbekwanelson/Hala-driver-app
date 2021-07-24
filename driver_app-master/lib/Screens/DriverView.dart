import 'package:driverapp/Authenticate/Auth.dart';
import 'package:driverapp/Models/Customer.dart';
import 'package:driverapp/Models/CustomerActive.dart';
import 'package:driverapp/Screens/CollectOrder.dart';
import 'package:driverapp/Shared/Database.dart';
import 'package:driverapp/Shared/UserDrawer.dart';
import 'package:driverapp/States/CollectOrderState.dart';
import 'package:driverapp/States/DriverViewState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

class DriverView extends StatefulWidget {
  @override
  _DriverViewState createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<List<Customer>>(context);
    final customersActive = Provider.of<List<CustomerActive>>(context);
    return customers ==null ? Scaffold(
      appBar: AppBar(
        title:Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "No orders yet",
            style:TextStyle(
                fontSize: 20
            )

        ),
      ),
    ): Scaffold(
      drawer: UserDrawer(),
      appBar: AppBar(
        title:Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
                itemBuilder: (context,index){
                print(customers[index].shop);
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      title: Text(
                          'Order $index',
                        style:TextStyle(
                          fontSize: 20
                        )
                      ),
                      subtitle: Text(
                          customers[index].shop ?? " ",
                          style:TextStyle(
                              fontSize: 18
                          )
                      ),
                      onTap: ()async{
                       dynamic uid =  await Auth().inputData();

                          await DriverViewState(driverId: uid).customerSelected(customers[index].custId,customers[index].orderNames);



                        setState(() {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamProvider<List<Customer>>
                                      .value(
                                        value: CollectOrderState().driverCollectOrder(),
                                        child: CollectOrder(
                                          customer: customers[index],
                                          seen: false,
                                        ),
                                      )

                                    )
                          );

                        });
                      },
                    ),
                  );

                }),
          ),
          Center(
            child: Text(
              "Pending orders",
              style: TextStyle(
                  letterSpacing: 2,
                fontSize: 20
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),

          Expanded(
            child: ListView.builder(
                itemCount: customersActive.length,
                itemBuilder: (context,index){
                  print(customersActive[index].shop);
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      title: Text(
                          'Order $index',
                          style:TextStyle(
                              fontSize: 20
                          )
                      ),
                      subtitle: Text(
                          customersActive[index].shop ?? " ",
                          style:TextStyle(
                              fontSize: 18
                          )
                      ),
                      onTap: ()async{
                        dynamic uid =  await Auth().inputData();

                        await DriverViewState(driverId: uid).customerSelected(customersActive[index].custId,customersActive[index].orderNames);



                        setState(() {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamProvider<List<CustomerActive>>
                                      .value(
                                    value: CollectOrderState().driverCollectOrderActive(),
                                    child: CollectOrder(
                                      customer: customersActive[index],
                                      seen: true,
                                    ),
                                  )

                              )
                          );

                        });
                      },
                    ),
                  );

                }),
          ),
        ],
      ),
    );
  }
}
