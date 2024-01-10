import 'package:flutter/material.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view/pages/AdminScaffold/admin_scaffold_page.dart';

import '../../../core/routes/routes_name.dart';
import '../../../utils/text_design.dart';

// Define a User model to hold user details
class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});
}

// Example list of users (replace this with your actual user data)
List<User> userList = [
  User(name: 'John Doe', email: 'john@example.com', password: 'password123'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  User(name: 'Jane Smith', email: 'jane@example.com', password: 'pass@word'),
  // Add more users as needed
];

class UserManagement extends StatelessWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: RouteName.usermanagement,
      body: SizedBox(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top:30.0,left:30.0,bottom:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextDesign(
                  text: 'User Management',
                  fontweight: FontWeight.w700,
                  fontsize: 24,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(color: Colors.black, width: 2),
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => AppColor.secondaryColor),
                      columns: const [
                        DataColumn(
                            label: TextDesign(
                              text: 'S.N.',
                              fontweight: FontWeight.w600,
                              fontsize: 16,
                            ),
                            numeric: true),
                        DataColumn(
                            label: TextDesign(
                          text: 'Name',
                          fontweight: FontWeight.w600,
                          fontsize: 16,
                        )),
                        DataColumn(
                            label: TextDesign(
                          text: 'Email',
                          fontweight: FontWeight.w600,
                          fontsize: 16,
                        )),
                        DataColumn(
                            label: TextDesign(
                          text: 'Password',
                          fontweight: FontWeight.w600,
                          fontsize: 16,
                        )),
                        DataColumn(
                            label: TextDesign(
                          text: 'Actions',
                          fontweight: FontWeight.w600,
                          fontsize: 16,
                        )),
                      ],
                      rows: List.generate(
                        userList.length,
                        (index) => DataRow(cells: [
                          DataCell(Text('${index + 1.toInt()}')),
                          DataCell(Text(userList[index].name)),
                          DataCell(Text(userList[index].email)),
                          DataCell(Text(userList[index].password)),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                    Icons.block), // Replace with disable icon
                                onPressed: () {
                                  // Implement disable user logic
                                  // For example: userList[index].disabled = true;
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColor.redColor,
                                ),
                                onPressed: () {
                                  // Implement delete user logic
                                  // For example: userList.removeAt(index);
                                },
                              ),
                            ],
                          )),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
