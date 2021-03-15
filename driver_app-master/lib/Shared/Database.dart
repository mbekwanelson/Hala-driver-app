import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/LocationN.dart';
import 'package:driverapp/Models/Customer.dart';
import 'package:firebase_core/firebase_core.dart';



class DataBase{
  LocationN location;
  LocationN _locationFromSnapshot(DocumentSnapshot snapshot){
    location =
        LocationN(
            lat: snapshot.data["Customerlatitude"],
            long: snapshot.data["Customerlongitude"]);
    return location;
  }

  // Returns user location





  Future loadLocation(double latitude,double longitude,String uid) async{

    return await Firestore.instance
        .collection("Location")
        .document(uid)
        .setData({
          "Driverlatitude": latitude,
          "Driverlongitude": longitude,
        });
  }



}