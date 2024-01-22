import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view/pages/AdminScaffold/admin_scaffold_page.dart';

import '../../../core/routes/routes_name.dart';
import '../../../data/lists.dart';
import '../../../resources/custom_dropdown.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/text_design.dart';
import '../../../widgets/title_text.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var selectedValue;
    TextEditingController searchC = TextEditingController();
    return MyScaffold(
      route: RouteName.usermanagement,
      body: SizedBox(
        height: size.height * 0.899,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'Show',
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 68.7,
                              height: 40,
                              child: CustomDropdown(
                                number: true,
                                onChanged: (value) {
                                  // Update the selected value when an item is chosen
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                data: items,
                                fontSize: 12,
                                values: selectedValue,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'entries',
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  size.width < 900
                      ? const SizedBox()
                      : const Expanded(child: SizedBox()),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomFields(
                            controller: searchC,
                            hinttext: 'Search',
                            isSmall: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add Category',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white54,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleText(text: "ID", flex: 1),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Category",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Customer",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Date",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    const TitleText(
                      text: "Amount",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Payment Mode",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Status",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Actions",
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 1.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${index + 1}.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'Shyam Bahadur',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Health',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '\$1000',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Fonepay',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.buttonColor1,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Processing',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: AppColor.buttontxtColor1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(Icons.edit_square),
                                    onPressed: () {},
                                  ),
                                ),

                                // const Icon(Icons.remove_red_eye),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColor.redColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.more_vert_rounded,
                                      color: AppColor.primaryColor,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return const AlertDialog(
                                              title: Text('User Details'),
                                            );
                                          });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // SizedBox(
      //   child: Align(
      //     alignment: Alignment.centerLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(top:30.0,left:30.0,bottom:10.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const TextDesign(
      //             text: 'User Management',
      //             fontweight: FontWeight.w700,
      //             fontsize: 24,
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           SizedBox(
      //             child: SingleChildScrollView(
      //               scrollDirection: Axis.horizontal,
      //               child: DataTable(
      //                 border: TableBorder.all(color: Colors.black, width: 2),
      //                 headingRowColor: MaterialStateColor.resolveWith(
      //                     (states) => AppColor.secondaryColor),
      //                 columns: const [
      //                   DataColumn(
      //                       label: TextDesign(
      //                         text: 'S.N.',
      //                         fontweight: FontWeight.w600,
      //                         fontsize: 16,
      //                       ),
      //                       numeric: true),
      //                   DataColumn(
      //                       label: TextDesign(
      //                     text: 'Name',
      //                     fontweight: FontWeight.w600,
      //                     fontsize: 16,
      //                   )),
      //                   DataColumn(
      //                       label: TextDesign(
      //                     text: 'Email',
      //                     fontweight: FontWeight.w600,
      //                     fontsize: 16,
      //                   )),
      //                   DataColumn(
      //                       label: TextDesign(
      //                     text: 'Password',
      //                     fontweight: FontWeight.w600,
      //                     fontsize: 16,
      //                   )),
      //                   DataColumn(
      //                       label: TextDesign(
      //                     text: 'Actions',
      //                     fontweight: FontWeight.w600,
      //                     fontsize: 16,
      //                   )),
      //                 ],
      //                 rows: List.generate(
      //                   userList.length,
      //                   (index) => DataRow(cells: [
      //                     DataCell(Text('${index + 1.toInt()}')),
      //                     DataCell(Text(userList[index].name)),
      //                     DataCell(Text(userList[index].email)),
      //                     DataCell(Text(userList[index].password)),
      //                     DataCell(Row(
      //                       children: [
      //                         IconButton(
      //                           icon: const Icon(
      //                               Icons.block), // Replace with disable icon
      //                           onPressed: () {
      //                             // Implement disable user logic
      //                             // For example: userList[index].disabled = true;
      //                           },
      //                         ),
      //                         IconButton(
      //                           icon: Icon(
      //                             Icons.delete,
      //                             color: AppColor.redColor,
      //                           ),
      //                           onPressed: () {
      //                             // Implement delete user logic
      //                             // For example: userList.removeAt(index);
      //                           },
      //                         ),
      //                       ],
      //                     )),
      //                   ]),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
