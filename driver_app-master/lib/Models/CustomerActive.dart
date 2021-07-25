class CustomerActive{
//exactly the same as customer
  String custId;
  String orderNumber;
  String shop;
  List<String> orderNames = [];


  CustomerActive({this.custId,this.orderNumber,this.shop});


  addOrderName(String name){
    orderNames.add(name);
  }

}