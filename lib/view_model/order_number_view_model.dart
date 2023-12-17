// import 'package:bms_win/db/app.db.dart';
// // import 'package:bms_win/db/db_models.dart';
// import 'package:bms_win/db/repository/customer_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// // import 'package:provider/provider.dart';
// import 'dart:async';
// import '../db/repository/order_number_repository.dart';

// class OrderNumberViewModel with ChangeNotifier {
//   //  make a constructor and call getall orders function
//   OrderNumberViewModel() {
//     // refreshOrdersNumbers();
//     getAllOrderNumbers();
//     getSumOfCustomer(DateTime.now(), DateTime.now());
//   }

//   final OrderNumberRepository _ordernumberRepository = OrderNumberRepository();
//   final CustomerRepository _customerRepository = CustomerRepository();
//   Logger logger = Logger();

//   List<OrderNumberData> _allOrdernumbers = [];
//   List<OrderNumberData> get allOrderNumbers => _allOrdernumbers;
//   List<Map> _summaryDetail = [];
//   List<Map> get summaryDetail => _summaryDetail;
//   bool _loading = false;
//   bool get loading => _loading;

//   Future<void> getAllOrderNumbers() async {
//     try {
//       var orders = await _ordernumberRepository.getOrderNumber();
//       _allOrdernumbers = orders;
//     } on Exception catch (e) {
//       logger.e(e.toString());
//     }

//     notifyListeners();
//   }

//   OrderNumberData getOrderNumberById(int id) {
//     return _allOrdernumbers.firstWhere((element) => element.id == id);
//   }

//   void refreshOrdersNumbers() {
//     OrderNumberRepository().getOrderNumber().then((orders) {
//       _allOrdernumbers = orders;
//       // print("the all order numbers are $_allOrdernumbers");
//       // _orders = orderss.where((element) => false == element.isDeleted).toList();
//     });
//     notifyListeners();
//   }

//   Future<int> addOrderNumber(OrderNumberCompanion order) async {
//     int id = await OrderNumberRepository().addOrderNumber(order);
//     refreshOrdersNumbers();
//     notifyListeners();
//     return id;
//   }

//   void updateOrderNumber(OrderNumberCompanion agent) {
//     OrderNumberRepository().updateOrderNumber(agent);
//     refreshOrdersNumbers();
//     notifyListeners();
//   }

//   void deleteOrder(int id) {
//     OrderNumberRepository().deleteOrderNumber(id).then((_) {
//       refreshOrdersNumbers();
//       notifyListeners();
//     });
//   }

//   void getSumOfCustomer(DateTime startDate, DateTime endDate) async {
//     try {
//       _loading = true; // Set loading to true while fetching data
//       List<CustomerData> allCustomers = await _customerRepository.getCustomer();
//       // print('All the customers are ${allCustomers}');
//       List<Map> customerDetails = [];
//       final List<CustomerData> filteredCustomers =
//           allCustomers.where((customer) {
//         // Convert createdAt DateTime to 'yyyy-MM-dd' format for comparison
//         String formattedCreatedAt =
//             DateFormat('yyyy-MM-dd').format(customer.createdAt!);
//         String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
//         String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);

//         bool isInDateRange = customer.createdAt != null &&
//             formattedCreatedAt.compareTo(formattedStartDate) >=
//                 0 && // After or equal to startDate
//             formattedCreatedAt.compareTo(formattedEndDate) <=
//                 0; // Before or equal to endDate
//         // print(
//         //     'Customer ${customer.customerName} - Created At: ${customer.createdAt}, Is in Date Range: $isInDateRange');

//         return isInDateRange;
//       }).toList();
//       // print('All the Filtered Customers are ${filteredCustomers}');

//       // Check if the list is empty or not
//       if (filteredCustomers.isEmpty) {
//         // print('No customers found within the specified date range.');
//       } else {
//         // Print specific details of each filtered customer
//         filteredCustomers.forEach((customer) {
//           // print(
//           //     'Customer ID: ${customer.id}, Created At: ${customer.createdAt}');
//         });
//       }
//       for (final customer in filteredCustomers) {
//         final List<OrderNumberData> customerOrders =
//             _allOrdernumbers.where((order) {
//           String formattedCreatedAt =
//               DateFormat('yyyy-MM-dd').format(customer.createdAt!);
//           String formattedStartDate =
//               DateFormat('yyyy-MM-dd').format(startDate);
//           String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);
//           // print(
//           //     'Checking Order - Customer ID: ${order.customerId}, Created Date: ${formattedStartDate}  ${formattedEndDate}, Order Date: ${order.createdAt}, Company: ${order.companyName}, Order Value: ${order.value}');
//           bool isInDateRange = order.customerId == customer.id &&
//               order.createdAt != null &&
//               formattedCreatedAt.compareTo(formattedStartDate) >=
//                   0 && // After or equal to startDate
//               formattedCreatedAt.compareTo(formattedEndDate) <=
//                   0; // Before or equal to endDate

//           return isInDateRange;
//         }).toList();

//         // print('Order in ${customerOrders}');

//         if (customerOrders.isEmpty) {
//           print(
//               'No orders found for Customer ID: ${customer.id} within the specified date range.');
//         } else {
//           // Enter the loop only if orders exist for the customer within the date range
//           double heTotal = 0;
//           double mktwsbTotal = 0;
//           // print('Order in ${customerOrders}');
//           for (final order in customerOrders) {
//             if (order.companyName == 'H' || order.companyName == 'E') {
//               heTotal += order.value;
//               // print('Order Value is ${order.value}');
//               // print('heTotal is $heTotal');
//             } else if (order.companyName == 'M' ||
//                 order.companyName == 'K' ||
//                 order.companyName == 'T' ||
//                 order.companyName == 'W' ||
//                 order.companyName == 'S' ||
//                 order.companyName == 'B') {
//               mktwsbTotal += order.value;
//               // print('Order Value is ${order.value}');
//               // print('mktwsbTotal is $mktwsbTotal');
//             }
//           }
//           customerDetails.add({
//             'customerId': customer.id,
//             'heTotal': heTotal,
//             'mktwsbTotal': mktwsbTotal
//           });
//           logger.i('Customer ${customer.id} - HE Total: $heTotal');
//           logger.i('Customer ${customer.id} - MKTWSB Total: $mktwsbTotal');
//         }
//         _summaryDetail = customerDetails;

//         // print("the summary detail is ${_summaryDetail}");
//         _loading = false;
//         notifyListeners();
//       }
//     } catch (e) {
//       _loading = false; // In case of an error, ensure loading is set to false
//       logger.e('Error occurred during data fetching: $e');
//       notifyListeners();
//     }
//   }

// // Function to find the total value of orders with the same order number and company name
//   double getTotalValueByOrderNumberAndCompany(
//       String orderNumber, String companyName) {
//     double total = 0;

//     List<OrderNumberData> orderNumberWithSameNumAndCompany = _allOrdernumbers
//         .where((element) =>
//             element.ordernumber == orderNumber &&
//             element.companyName == companyName)
//         .toList();

//     for (int i = 0; i < orderNumberWithSameNumAndCompany.length; i++) {
//       total = total + orderNumberWithSameNumAndCompany[i].value;
//     }
//     print('Total is : ${total}');
//     return total;
//   }

//   Future<void> getOrderNumberExceedData(
//       BuildContext context, int orderId) async {
//     await getAllOrderNumbers();

//     List<OrderNumberData> orderNumberByOrderId = _allOrdernumbers
//         .where((element) => element.orderId == orderId)
//         .toList();

//     List<OrderNumberData> ordersExceedingLimit = [];
//     for (var order in orderNumberByOrderId) {
//       double totalValue = getTotalValueByOrderNumberAndCompany(
//           order.ordernumber, order.companyName);
//       if (totalValue > 8) {
//         ordersExceedingLimit.add(order);
//       }
//     }

//     if (ordersExceedingLimit.isNotEmpty) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                       title: Text(
//                     "Limit Exceed by:",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   )),
//                   for (var order in ordersExceedingLimit)
//                     ListTile(
//                       title: Text(
//                         "Order Number: ${order.ordernumber} in Company Name: ${order.companyName} is Exceeded by: ${getTotalValueByOrderNumberAndCompany(order.ordernumber, order.companyName) - 8}",
//                         // "${order.ordernumber} in ${order.companyName}: ${getTotalValueByOrderNumberAndCompany(order.ordernumber, order.companyName) - 8}",
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
