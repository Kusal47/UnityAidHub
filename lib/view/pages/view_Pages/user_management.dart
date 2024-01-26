import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view/pages/AdminScaffold/admin_scaffold_page.dart';
import 'package:unity_admin/view_model/user_manage_view_model.dart';
import '../../../Models/user_model.dart';
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
  void initState() {
    super.initState();
    addPost();
  }

  List<User> userList = [];
  void addPost() {
    for (var post in userLists) {
      userList.add((post));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<UserViewModel>(context);
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
                                    viewModel.selectedValue = value!;
                                  });
                                },
                                data: items,
                                fontSize: 12,
                                values: viewModel.selectedValue,
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
                            controller: viewModel.searchC,
                            hinttext: 'Enter user name...',
                            isSmall: true,
                            labeltext: 'Search User',
                            onPressed: () {
                              viewModel.searchUser(
                                  viewModel.searchC.text, userList);
                            },
                            onClose: () {
                              setState(() {
                                viewModel.searchC.clear();
                                viewModel.searchResult.clear();
                              });
                            },
                            isNotEmpty:
                                viewModel.searchC.text.isEmpty ? false : true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.category);
                      },
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
                    const Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          TitleText(
                            text: "Category",
                          ),
                          // Icon(
                          //   Icons.unfold_more,
                          //   size: 25,
                          //   color: AppColor.textColor,
                          // ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          TitleText(
                            text: "Customer",
                          ),
                          // Icon(
                          //   Icons.unfold_more,
                          //   size: 25,
                          //   color: AppColor.textColor,
                          // ),
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
              child: userList.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(100.0),
                      child: Text('No User Found'),
                    )
                  : viewModel.searchResult.isEmpty
                      ? ListView(
                          // physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            userList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 1.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Text(
                                      userList[index].category,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      userList[index].username,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      userList[index].date,
                                      // DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      userList[index].amount,
                                      // '\$1000',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      userList[index].paymentMethod,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.buttonColor1,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          userList[index].status,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColor.buttontxtColor1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              icon:
                                                  const Icon(Icons.edit_square),
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
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Delete User ${userList[index].username}'),
                                                        content: Text(
                                                            "Are you sure to delete this user"),
                                                        actions: [
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                userList.remove(
                                                                    userList[
                                                                        index]);
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('OK'),
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.more_vert_rounded,
                                                color: AppColor.primaryColor,
                                              ),
                                              onPressed: () {
                                                // selectedPostIndex =
                                                //     userList[index].userId;

                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return AlertDialog(
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'User Details : ${userList[index].userId}'),
                                                            Text(
                                                                'User Details : ${userList[index].username}'),
                                                            Text(
                                                                'User Details : ${userList[index].category}'),
                                                            Text(
                                                                'User Details : ${userList[index].date}'),
                                                            Text(
                                                                'User Details : ${userList[index].paymentMethod}'),
                                                            Text(
                                                                'User Details : ${userList[index].status}'),
                                                            Text(
                                                                'User Details : ${userList[index].amount}'),
                                                          ],
                                                        ),
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
                        )
                      : ListView(
                          // physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            viewModel.searchResult.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 1.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Text(
                                      viewModel.searchResult[index].category,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      viewModel.searchResult[index].username,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      viewModel.searchResult[index].date,
                                      // DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      viewModel.searchResult[index].amount,
                                      // '\$1000',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      viewModel
                                          .searchResult[index].paymentMethod,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.buttonColor1,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          viewModel.searchResult[index].status,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColor.buttontxtColor1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              icon:
                                                  const Icon(Icons.edit_square),
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
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Delete User ${viewModel.searchResult[index].username}'),
                                                        content: Text(
                                                            "Are you sure to delete this user"),
                                                        actions: [
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                userList.remove(
                                                                    viewModel
                                                                            .searchResult[
                                                                        index]);
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('OK'),
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.more_vert_rounded,
                                                color: AppColor.primaryColor,
                                              ),
                                              onPressed: () {
                                                // selectedPostIndex =
                                                //     userList[index].userId;

                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return AlertDialog(
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].userId}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].username}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].category}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].date}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].paymentMethod}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].status}'),
                                                            Text(
                                                                'User Details : ${viewModel.searchResult[index].amount}'),
                                                          ],
                                                        ),
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
    );
  }
}
