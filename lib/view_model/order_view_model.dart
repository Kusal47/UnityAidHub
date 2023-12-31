// import 'package:bms_win/db/app.db.dart';
// import 'package:bms_win/db/repository/order.repository.dart';
// import 'package:bms_win/utils/helper_functions.dart';
// import 'package:bms_win/view_model/customer/customer_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// import 'dart:async';

// import '../db/repository/customer_repository.dart';
// import '../db/repository/order_number_repository.dart';

// class OrderViewModel with ChangeNotifier {
//   //  make a constructor and call getall orders function
//   OrderViewModel() {
//     getAllOrders();
//   }
//   final OrderRepository _orderRepository = OrderRepository();
//   final CustomerViewModel _customerViewModel = CustomerViewModel();
//   final CustomerRepository _customerRepository = CustomerRepository();
//   Logger logger = Logger();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController billController = TextEditingController();
//   final TextEditingController dateTimeController = TextEditingController();
//   final TextEditingController dateTimeController1 = TextEditingController();

//   DateTime? _selectedDate;

//   DateTime? get selectedDate => _selectedDate;

//   int? selectedOrderId;
//   bool? showResetButton = false;

//   List<OrderData> _allOrders = [];
//   List<OrderData> get allOrders => _allOrders;
//   List<Map> _searchedOrders = [];
//   List<Map> get searchedOrders => _searchedOrders;
//   int? get selectedCustomer => selectedOrderId;

//   setShowResetButton(bool value) {
//     showResetButton = value;
//     notifyListeners();
//   }

//   void resetSearch() {
//     nameController.text = '';
//     billController.text = '';
//     dateTimeController.text = '';
//     dateTimeController1.text = '';
//     _selectedDate = null;
//     showResetButton = false;

//     refreshOrders();
//   }

//   void setSelectedDate(DateTime? date) {
//     _selectedDate = date;
//     notifyListeners();
//   }

//   Future<OrderData> getLastOrder() async {
//     return await _orderRepository.getOrders().then((value) => value.last);
//   }

//   Future<int> getBillNumber() async {
//     List<OrderData> orders = await _orderRepository.getOrders();

//     if (orders.isEmpty) {
//       print("There are no any orders");
//       return 1;
//     }

//     orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

//     OrderData lastOrder = orders.first;

//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
//     // String formattedDate = '${now.year}-${now.month}-${now.day}';
//     String lastDate = DateFormat("yyyy-MM-dd").format(lastOrder.createdAt!);

//     if (formattedDate == lastDate) {
//       return lastOrder.billNo + 1;
//     } else {
//       return 1;
//     }
//   }

//   Future<void> getAllOrders() async {
//     try {
//       var orders = await _orderRepository.getOrders();
//       _allOrders = orders;
//       // _orders = orders.where((element) => false == element.isDeleted).toList();

//       notifyListeners();
//     } on Exception catch (e) {
//       logger.e(e.toString());
//     }
//   }

//   OrderData getOrderById(int id) {
//     return _allOrders.firstWhere((element) => element.id == id);
//   }

//   void refreshOrders() {
//     OrderRepository().getOrders().then((orders) {
//       _allOrders = orders;
//       // _orders = orderss.where((element) => false == element.isDeleted).toList();
//     });
//     notifyListeners();
//   }

//   Future<int> addOrder(OrderCompanion order) async {
//     int id = await OrderRepository().addOrder(order);
//     refreshOrders();
//     notifyListeners();
//     return id;
//   }

//   void updateOrder(OrderCompanion agent) {
//     OrderRepository().updateAddress(agent);
//     refreshOrders();
//     notifyListeners();
//   }

//   void deleteOrder(int id) {
//     OrderRepository().deleteOrder(id).then((_) {
//       refreshOrders();
//       notifyListeners();
//     });
//   }

//   tempdeleteOrder(int id) {
//     OrderRepository().tempDeleteOrder(id).then((_) {
//       refreshOrders();
//     });
//   }

//   void setSelectedOrderId(int id) {
//     selectedOrderId = id;
//   }

//   void searchByCustomerName(String customerName) {
//     _allOrders = _allOrders
//         .where(
//             (element) => element.userName.toLowerCase().contains(customerName))
//         .toList();

//     notifyListeners();
//   }

//   void searchByBillNumber(String billNumber) {
//     _allOrders = _allOrders.where((element) {
//       // print("Bill number is ${element.billNo}");
//       return element.billNo.toString().contains(billNumber);
//     }).toList();

//     // print("all order are: ${_allOrders}");

//     notifyListeners();
//   }

//   void searchOrdersByDate(DateTime createdAt) {
//     _allOrders = _allOrders
//         .where((order) =>
//             order.createdAt!.year == createdAt.year &&
//             order.createdAt!.month == createdAt.month &&
//             order.createdAt!.day == createdAt.day)
//         .toList();
//     notifyListeners();
//   }

//   Future<void> searchByTokenAndDate(String token, DateTime date) async {
//     try {
//       List<OrderData> allOrders = await _orderRepository.getOrders();
//       List<Map> filteredOrders = [];

//       for (var order in allOrders) {
//         String formattedDate =
//             DateFormat("yyyy-MM-dd").format(order.createdAt!);
//         if (formattedDate == DateFormat("yyyy-MM-dd").format(date)) {
//           if (order.actualOrder.contains(token)) {
//             List<String> lines = order.actualOrder.split('\n');
//             if (lines.length > 1) {
//               String firstLine = lines[0];
//               for (int i = 1; i < lines.length; i++) {
//                 if (lines[i].contains(token)) {
//                   filteredOrders.add(
//                     {
//                       'id': order.id,
//                       'company': firstLine,
//                       'token': lines[i],
//                       'username': order.userName
//                     },
//                   );

//                   break;
//                 }
//               }
//             }
//           }
//         }
//       }

//       _searchedOrders = filteredOrders;
//       notifyListeners();
//     } catch (e) {
//       print("Error during search: $e");
//       // Handle the error in an appropriate way (e.g., show a message to the user).
//     }
//   }

//   // FOR TOTAL
//   // FOR TOTAL

//   getTotals() {
//     double total = 0;
//     double todaysTotal = 0;

//     for (int i = 0; i < _allOrders.length; i++) {
//       if (DateFormat('yyyy-MM-dd').format(_allOrders[i].createdAt!) ==
//           DateFormat('yyyy-MM-dd').format(DateTime.now())) {
//         todaysTotal = todaysTotal + _allOrders[i].total;
//       }
//       total = total + _allOrders[i].total;
//     }

//     return {
//       'total': HelperFunctions().longNumToShort(total),
//       'todaysTotal': HelperFunctions().longNumToShort(todaysTotal)
//     };
//   }

//   Map<String, double> getTotalsNew() {
//     double total = 0;
//     double currentMonthTotal = 0;
//     double lastMonthTotal = 0;

//     // Get the first day of the current month
//     DateTime currentDate = DateTime.now();
//     DateTime firstDayOfCurrentMonth =
//         DateTime(currentDate.year, currentDate.month, 1);

//     // Calculate the first day of last month
//     DateTime firstDayOfLastMonth =
//         DateTime(currentDate.year, currentDate.month - 1, 1);
//     if (firstDayOfLastMonth.month == 12) {
//       firstDayOfLastMonth = DateTime(currentDate.year - 1, 12, 1);
//     }

//     for (int i = 0; i < _allOrders.length; i++) {
//       // Check if the order is in the current month
//       if (_allOrders[i].createdAt != null &&
//           _allOrders[i].createdAt!.isAfter(firstDayOfCurrentMonth)) {
//         currentMonthTotal += _allOrders[i].total;
//       }
//       // Check if the order is in the last month
//       if (_allOrders[i].createdAt != null &&
//           _allOrders[i].createdAt!.isAfter(firstDayOfLastMonth) &&
//           _allOrders[i].createdAt!.isBefore(firstDayOfCurrentMonth)) {
//         lastMonthTotal += _allOrders[i].total;
//       }
//       total += _allOrders[i].total;
//     }

//     return {
//       'total': HelperFunctions().longNumToShort(total),
//       'currentMonthTotal': HelperFunctions().longNumToShort(currentMonthTotal),
//       'lastMonthTotal': HelperFunctions().longNumToShort(lastMonthTotal),
//     };
//   }

//   getTotalsByAgent(int agentId) {
//     // print(" get tptal by agent called");
//     double total = 0;
//     double todaysTotal = 0;
//     List<OrderData> agentsOrderData = [];

//     if (_allOrders.isNotEmpty) {
//       agentsOrderData = _allOrders
//           .where((element) =>
//               _customerViewModel.getCustomerById(element.customerId).agentId ==
//               agentId)
//           .toList();

//       for (int i = 0; i < agentsOrderData.length; i++) {
//         if (DateFormat('yyyy-MM-dd').format(agentsOrderData[i].createdAt!) ==
//             DateFormat('yyyy-MM-dd').format(DateTime.now())) {
//           todaysTotal = todaysTotal + agentsOrderData[i].total;
//         }
//         total = total + agentsOrderData[i].total;
//       }
//     }

//     return {
//       'total': HelperFunctions().removeDecimalIfNeeded(
//           HelperFunctions().longNumToShort(total).toString()),
//       'todaysTotal': HelperFunctions().removeDecimalIfNeeded(
//           HelperFunctions().longNumToShort(todaysTotal).toString())
//     };
//   }

//   Future<String> replaceSymbolsInOrders(String order) async {
//     // return order.replaceAll('#', '-');
//     return order.replaceAll(RegExp(r'[#=]'), '-');
//   }
// }
