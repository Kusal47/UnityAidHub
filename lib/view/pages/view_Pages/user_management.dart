import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view/pages/AdminScaffold/admin_scaffold_page.dart';
import 'package:unity_admin/view_model/user_manage_view_model.dart';
import '../../../Models/user_model.dart';
import '../../../core/routes/routes_name.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/text_design.dart';
import '../../../utils/user_detail_dialog.dart';
import '../../../widgets/title_text.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  late Future<List<AppUser>> _authUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authUser = Provider.of<UserViewModel>(context).fetchUserFromApi();
  }

  bool showError = false;
  bool search = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        showError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<UserViewModel>(context);

    return MyScaffold(
        route: RouteName.usermanagement,
        body: SizedBox(
            height: size.height * 0.899,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextDesign(
                                text: 'All Users', fontsize: 24, fontweight: FontWeight.w900),
                          ),
                         ],
                      ),
                    ),
                    size.width < 900 ? const SizedBox() : const Expanded(child: SizedBox()),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomFields(
                              controller: viewModel.searchC,
                              hinttext: 'Enter user name...',
                              isSmall: true,
                              icon: Icons.close,
                              searchIcon: Icons.search,
                              labeltext: 'Search User',
                              onFieldSubmitted: (value) {
                                setState(() {
                                  viewModel.searchUser(value!);
                                  
                                  search = true;
                                });

                                return;
                              },
                              onPressed: () {
                                setState(() {
                                  viewModel.searchUser(viewModel.searchC.text);
                                  search = true;
                                });
                              },
                              onClose: () {
                                setState(() {
                                  search = false;
                                  viewModel.searchResult.clear();
                                  viewModel.searchC.clear();
                                });
                              },
                              isSearch: search,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.searchC.clear();
                        viewModel.searchResult.clear();
                        Navigator.pushNamed(context, RouteName.category);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextDesign(
                              text: 'Add Category',
                              textAlign: TextAlign.center,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColor.borderColor,
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(text: "S.N.", flex: 1),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              TitleText(
                                text: "Users",
                              ),
                              
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              TitleText(
                                text: "Email",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              TitleText(
                                text: "Contact",
                              ),
                             
                            ],
                          ),
                        ),
                        TitleText(
                          text: "Address",
                          flex: 3,
                        ),
                        TitleText(
                          text: "Roles",
                          flex: 2,
                        ),
                        TitleText(
                          text: "Created At",
                          flex: 2,
                        ),
                        TitleText(
                          text: "Status",
                          flex: 2,
                        ),
                        TitleText(
                          text: "Actions",
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<AppUser>>(
                      future: _authUser,
                      builder: (context, snapshot) {

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: SpinKitWaveSpinner(
                              color: AppColor.primaryColor,
                              size: 40.0,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return showError
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const TextDesign(
                                      text: '403 Error',
                                      fontsize: 50,
                                    ),
                                    Icon(
                                      CupertinoIcons.minus_circle_fill,
                                      size: 100,
                                      color: AppColor.redColor,
                                    ),
                                    const TextDesign(text: 'Forbidden', fontsize: 50)
                                  ],
                                )
                              : Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpinKitWaveSpinner(
                                      color: AppColor.primaryColor,
                                      size: 40.0,
                                    ),
                                    const Text('Something went wrong'),
                                  ],
                                ));
                        } else {
                          List<AppUser> userList = snapshot.data ?? [];
                          return userList.isEmpty
                              ? Center(
                                child: Container(
                                    padding: const EdgeInsets.all(100.0),
                                    child: const Text('No User Found'),
                                  ),
                              )
                              : viewModel.searchResult.isEmpty && search == false
                                  ? ListView.builder(
                                      itemCount: userList.length,
                                      itemBuilder: (context, index) {
                                        AppUser user = userList[index];
                                        return Padding(
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
                                                child: Text(
                                                  user.username,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  user.email,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  user.phoneNumber,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  user.address,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  user.role,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  user.date,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColor.buttonColor1,
                                                        borderRadius: BorderRadius.circular(10)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: TextDesign(
                                                        text: user.status.toLowerCase(),
                                                        textAlign: TextAlign.center,
                                                        color: user.status.toLowerCase() == 'active'
                                                            ? AppColor.primaryColor
                                                            : AppColor.buttontxtColor1,
                                                      ),
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
                                                    children: [
                                                      Expanded(
                                                          child: GestureDetector(
                                                              onTap: () {
                                                                showUserDetails(
                                                                    context, user, viewModel,
                                                                    isEdit: true);
                                                              },
                                                              child:
                                                                  const Icon(Icons.edit_square))),
                                                      Expanded(
                                                          child: GestureDetector(
                                                        onTap: () {
                                                          userDelete(
                                                            context,
                                                            user,
                                                            viewModel,
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: AppColor.redColor,
                                                        ),
                                                      )),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showUserDetails(
                                                                context, user, viewModel,
                                                                isEdit: false);
                                                          },
                                                          child: Icon(
                                                            Icons.more_vert_rounded,
                                                            color: AppColor.primaryColor,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount: viewModel.searchResult.length,
                                      itemBuilder: (context, index) {
                                        AppUser user = viewModel.searchResult[index];
                                        return Padding(
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
                                                    child: Text(
                                                      user.username,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      user.email,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      user.phoneNumber,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      user.address,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      user.role,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      user.date,
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
                                                          user.status,
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
                                                        children: [
                                                          Expanded(
                                                              child: GestureDetector(
                                                                  onTap: () {
                                                                    showUserDetails(
                                                                        context, user, viewModel,
                                                                        isEdit: true);
                                                                  },
                                                                  child: const Icon(
                                                                      Icons.edit_square))),
                                                          Expanded(
                                                              child: GestureDetector(
                                                            onTap: () {
                                                              userDelete(
                                                                context,
                                                                user,
                                                                viewModel,
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: AppColor.redColor,
                                                            ),
                                                          )),
                                                          Expanded(
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                showUserDetails(
                                                                    context, user, viewModel,
                                                                    isEdit: false);
                                                              },
                                                              child: Icon(
                                                                Icons.more_vert_rounded,
                                                                color: AppColor.primaryColor,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ]));
                                      });
                        }
                      }))
            ])));
  }
}
