// import 'package:bms_win/db/app.db.dart';
// import 'package:bms_win/db/repository/customer_repository.dart';
// import 'package:flutter/material.dart';

// class CustomerViewModel with ChangeNotifier {
//   CustomerViewModel() {
//     refreshCustomer();
//   }
//   List<CustomerData> _customers = [];
//   List<CustomerData> get customers => _customers;
//   List<CustomerData> _customerAgent = [];
//   List<CustomerData> get customerAgent => _customerAgent;
//   List<CustomerData> _customerNormal = [];
//   List<CustomerData> get customerNormal =>  _customerNormal;

//   void refreshCustomer() async {
//     await CustomerRepository().getCustomer().then((customerList) {
//       _customers = customerList;
//       _customerAgent =
//           customerList.where((element) => element.isAgent == true).toList();
//       _customerNormal =
//           customerList.where((element) => element.isAgent == false).toList();
//     }).catchError((error) {
//       print("Error fetching customers: $error");
//     });
//     // print("Customer Refreshed Successfuly");
//     notifyListeners();
//   }

//   CustomerData getCustomerById(int id) {
//     refreshCustomer();
//     return _customers.where((element) => element.id == id).toList()[0];
//   }


//   Future<int> addCustomer(String customerName, int agentId) async {
//     int id = await CustomerRepository().addCustomer(customerName, agentId);

//     refreshCustomer();
//     notifyListeners();
//     return id;
//   }

//   void updateCustomer(CustomerCompanion customer) {
//     CustomerRepository().updateCustomer(customer);
//     refreshCustomer();
//     notifyListeners();
//   }

//   void deleteCustomer(int id) {
//     CustomerRepository().deleteCustomer(id).then((_) {
//       notifyListeners();
//       refreshCustomer();
//     });
//   }
// }
