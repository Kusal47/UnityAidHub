// import 'package:bms_win/db/repository/customer_repository.dart';
// import 'package:bms_win/db/repository/order_number_repository.dart';
// import 'package:bms_win/view_model/customer/customer_view_model.dart';
// import 'package:bms_win/view_model/order_number_view_model.dart';
// import 'package:flutter/material.dart';

// import '../db/app.db.dart';

// class SummaryViewModel extends ChangeNotifier {
//   SummaryViewModel() {
//     // getCustomerWithOrderNo();
//   }
//   CustomerRepository cRepo = CustomerRepository();
//   OrderNumberRepository oNRepo = OrderNumberRepository();
//   // List<CustomerWithOrder> _customerWithOrderNo = [];
//   // List<CustomerWithOrder> get customerWithOrderNo => _customerWithOrderNo;

//   List<OrderNumberData> _orderNumWithCustomer = [];
//   List<OrderNumberData> get orderNumberWithCustomer =>
//       _orderNumWithCustomer;

//   DateTime _startDate =
//       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
//   DateTime _endDate = DateTime.now();

//   DateTime get startDate => _startDate;
//   DateTime get endDate => _endDate;

//   // void getCustomerWithOrderNo() async {
//   //   // _customerWithOrderNo = await cRepo.getCustomersWithOrder();
//   //   print("All customers  = $_customerWithOrderNo");
//   //   notifyListeners();
//   // }

//   // void getOrderNumberWithCustomer() async {
//   //   _orderNumWithCustomer = await oNRepo.getOrderNumberWithCustomerName();
//   // }

//   void resetFilter() {
//     DateTime startDate =
//         DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
//     DateTime endDate = DateTime.now();

//     notifyListeners();
//   }
// }
