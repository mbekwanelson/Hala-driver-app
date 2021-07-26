class CustomerActive{
//exactly the same as customer
  String custId;
  String orderNumber;
  String shop;
  String paymentMethod;
  List<String> orderNames = [];


  CustomerActive({this.custId,this.orderNumber,this.shop,this.paymentMethod});


  addOrderName(String name){
    orderNames.add(name);
  }

}