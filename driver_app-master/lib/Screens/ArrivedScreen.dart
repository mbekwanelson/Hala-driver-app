import 'package:driverapp/LocationN.dart';
import 'package:driverapp/Models/Customer.dart';
import 'package:driverapp/Shared/Database.dart';
import 'package:driverapp/States/ArrivedScreenState.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter/services.dart';

import '../main.dart';
class ArrivedScreen extends StatefulWidget {
  Customer customer;
  ArrivedScreen({this.customer});



  @override
  _ArrivedScreenState createState() => _ArrivedScreenState();
}

class _ArrivedScreenState extends State<ArrivedScreen> {
  LocationN customerLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      ArrivedScreenState().customerLocation(widget.customer.custId).then((value){
        setState(() {
          customerLocation = value;
        });
      });

  }
  @override
  Widget build(BuildContext context) {
    return customerLocation==null ? Scaffold(
      body: Container(
      child: Text(
          "Wait maaaahn!"
          ),
    )
    ):



      SafeArea(
        child: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              RaisedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    customerLocation.lat, customerLocation.long, 'Google Headquarters are here'),
                child: Text('Directions'),
              ),

              FlatButton(
                child: Text(
                  "Arrived"
                ),
                onPressed:()async{
                  ArrivedScreenState().driverArrived(widget.customer.custId, widget.customer.orderNames);
              }
              ),
              FlatButton(
                  onPressed: ()async{
                    ArrivedScreenState().orderDelivered(widget.customer.custId, widget.customer.orderNames);
                    Navigator.pop(context);
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>MyApp())
                    );
                  }
                  , child: Text(
                "Order Delivered"
              )
              ),
            ],
          ),
        )

    ),
      );
  }
}
