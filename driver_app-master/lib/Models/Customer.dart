
class Customer{

  String custId;
  String orderNumber;
  String shop;
  String paymentMethod;
  List<String> orderNames = [];


  Customer({this.custId,this.orderNumber,this.shop,this.paymentMethod});


  addOrderName(String name){
    orderNames.add(name);
  }


}