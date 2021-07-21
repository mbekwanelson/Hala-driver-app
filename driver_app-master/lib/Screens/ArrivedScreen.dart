import 'package:driverapp/LocationN.dart';
import 'package:driverapp/Models/Customer.dart';
import 'package:driverapp/Shared/Database.dart';
import 'package:driverapp/Shared/UserDrawer.dart';
import 'package:driverapp/States/ArrivedScreenState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter/services.dart';
import 'package:commons/commons.dart';

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

    ArrivedScreenState().customerLocation(widget.customer.custId).then((value) {
      setState(() {
        customerLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return customerLocation == null
        ? Scaffold(
            body: Container(
            child: Text("Wait maaaahn!"),
          ))
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white70,
                drawer: UserDrawer(),
                appBar: AppBar(
                  title: Text("Driver Options"),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                ),
                body: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                      scrollDirection: Axis.vertical,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          child: new InkWell(
                            child: Container(
                              /*decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Picture/haladirectionsicon.jpg"),
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topCenter,
                          scale: 0.3
                        ),
                      ),*/
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image(
                                    image: AssetImage(
                                        "Picture/haladirectionsicon.jpg"),
                                  )),
                                  SizedBox(height: 20),
                                  Text('Directions'),
                                ],
                              ),
                            ),
                            onTap: () => MapsLauncher.launchCoordinates(
                                customerLocation.lat,
                                customerLocation.long,
                                'Google Headquarters are here'),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                        ),
                        Card(
                          child: new InkWell(
                            child: Container(
                              /*decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Picture/arrivingwithbag.png"),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),*/
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image(
                                    image:
                                        AssetImage("Picture/arrivingwithbag.png"),
                                  )),
                                  SizedBox(height: 20),
                                  Text("Arrived"),
                                ],
                              ),
                            ),
                            onTap: () async {
                              ArrivedScreenState().driverArrived(
                                  widget.customer.custId,
                                  widget.customer.orderNames);

                              successDialog(
                                  context,
                                  "Customer Successfully Notified You Are Waiting Outside",
                                  positiveAction: (){},
                                  positiveText: "Confirm  ",
                                  negativeAction: (){},
                                  negativeText: "    ",
                                  neutralText: "        "
                              );

                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                        ),

                        /*  FlatButton(
                    child: Text("Arrived"),
                    onPressed:() async{
                      ArrivedScreenState().driverArrived(widget.customer.custId, widget.customer.orderNames);
                    }),
              */

                        /*FlatButton(
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
              ),*/
                        Card(
                          child: new InkWell(
                            child: Container(
                              /*decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Picture/halaarrivedicon.png"),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),*/
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image(
                                    image:
                                        AssetImage("Picture/halaarrivedicon.png"),
                                  )),
                                  SizedBox(height: 20),
                                  Center(child: Text("Order Delivered")),
                                ],
                              ),
                            ),
                            onTap: () async {


                              ArrivedScreenState().orderDelivered(
                                  widget.customer.custId,
                                  widget.customer.orderNames);

                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                        ),
                      ],
                    ),
                  ),
                )),
          );
  }
}
