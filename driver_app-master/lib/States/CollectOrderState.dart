import 'dart:core';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/Authenticate/Auth.dart';
import 'package:driverapp/Models/Customer.dart';
import 'dart:developer' as dev;

import 'package:driverapp/Models/CustomerActive.dart';

class CollectOrderState{


  Future orderCollected(String docId,List<String> titles) async{

    for(int i =0;i<titles.length;i++){
      Firestore.instance
          .collection("OrdersRefined")
          .document(docId)
          .updateData({
            "${titles[i]}.orderCollected":"Yes",
            "${titles[i]}.driverSeenOrderNumber":"Yes",
          },
      );
    }
  }

  // Gets orders for each customer on db
  List<Customer> _customer(QuerySnapshot snapshot){
    List<Customer> customers = [];
    Customer customer ;
    String custID;

    String shop;
    String orderNumber;
    String title;// so that i can access order later on
    //doc == each user
    snapshot.documents.forEach((doc) {
      // element == each order(for specific user) [number of orders]
      int n=0;
      int active =0;
      String paymentMethod;
      // for each order in document
      print("${doc.documentID}");
      if(doc.documentID != "placeholder"){
        doc.data.values.forEach((value) {
          //place any restrictions here...

          if (value["active"] ==1 && value["checkOut"]=="Yes" && value["driverSeen"]=="Yes" &&value["driverSeenOrderNumber"]=="No" ) {
            n++;
            active ++;
            print("_________________Got in?????????????????");
            shop = value["shop"] ?? " ";
            orderNumber = value["orderNumber"] ?? "Pending";
            title = value["title"];
            paymentMethod = value["Payment Method"];
            custID = doc.documentID;
            if (n == 1) {

              customer = Customer(
                  custId: custID,
                  orderNumber: orderNumber,
                  shop: shop,
                  paymentMethod: paymentMethod
              );
            }
            customer.addOrderName(title);
          }

        });
        if(active>0) {
          if (customer != null) {
            print("Shop : ${customer.shop}");
            print("Customer ID in CollectOrderState : ${customer.custId}");
            customers.add(customer);
          }
        }
      }
    });
    return customers;
  }

  List<CustomerActive> _customersActive(QuerySnapshot snapshot){
    List<CustomerActive> customers = [];
    CustomerActive customer ;
    String custID;

    String shop;
    String orderNumber;
    String title;// so that i can access order later on
    //doc == each user
    snapshot.documents.forEach((doc) {
      // element == each order(for specific user) [number of orders]
      int n=0;
      int active =0;
      String paymentMethod;
      // for each order in document
      print("${doc.documentID}");
      if(doc.documentID != "placeholder"){
        doc.data.values.forEach((value) {
          //place any restrictions here...

          if (value["active"] ==1 && value["checkOut"]=="Yes" && value["driverSeen"]=="Yes" &&value["driverSeenOrderNumber"]=="No" ) {
            n++;
            active ++;
            print("_________________Got in?????????????????");
            shop = value["shop"] ?? " ";
            orderNumber = value["orderNumber"] ?? "Pending";
            title = value["title"];
            paymentMethod = value["Payment Method"];
            custID = doc.documentID;
            if (n == 1) {

              customer = CustomerActive(
                  custId: custID,
                  orderNumber: orderNumber,
                  shop: shop,
                  paymentMethod: paymentMethod
              );
            }
            customer.addOrderName(title);
          }

        });
        if(active>0) {
          if (customer != null) {
            print("Shop : ${customer.shop}");
            print("Customer ID in CollectOrderState : ${customer.custId}");
            customers.add(customer);
          }
        }
      }
    });
    return customers;
  }



  Stream<List<Customer>> driverCollectOrder(){
    //returns snapshot of database and tells us of any changes [provider]
    return Firestore.instance.collection("OrdersRefined").snapshots().map(_customer);
  }
  Stream<List<CustomerActive>> driverCollectOrderActive(){
    //returns snapshot of database and tells us of any changes [provider]
    return Firestore.instance.collection("OrdersRefined").snapshots().map(_customersActive);
  }








}