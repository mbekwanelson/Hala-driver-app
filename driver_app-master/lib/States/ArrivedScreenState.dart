
import 'package:driverapp/LocationN.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    '';

class ArrivedScreenState{

  ArrivedScreenState(){

  }


  Future<LocationN> customerLocation(String custId)async {
    LocationN location;

    DocumentReference docRef =  Firestore.instance
        .collection("Location")
        .document(custId);
    DocumentSnapshot doc = await docRef.get();
    location = LocationN(
            lat: doc.data["Customerlatitude"],
            long: doc.data["Customerlongitude"]);
    return location;

  }

  Future driverArrived(String docId,List<String> titles) async{
    for(int i=0;i<titles.length;i++){
      await Firestore.instance
          .collection("OrdersRefined")
          .document(docId)
          .updateData({
        "${titles[i]}.driverArrived":1,
      },);
    }
  }

  Future orderDelivered(String docId,List<String> titles) async{
    for(int i=0;i<titles.length;i++){
      await Firestore.instance
          .collection("OrdersRefined")
          .document(docId)
          .updateData({
        "${titles[i]}.active":0,
      },);
    }
  }





}