import 'package:flutter/material.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/utils/text_design.dart';
import 'package:unity_admin/utils/toast_utils.dart';
import 'package:unity_admin/view_model/user_manage_view_model.dart';

import '../Models/user_model.dart';
import '../core/routes/routes_name.dart';
import '../resources/custom_dropdown.dart';
import '../resources/texfields_pages.dart';

void showUserDetails(
  BuildContext context,
  AppUser user,
  UserViewModel viewModel, {
  bool isEdit = false,
}) {
  viewModel.userId.text = user.userId.toString();
  viewModel.userName.text = user.username;
  viewModel.email.text = user.email;
  viewModel.phoneNo.text = user.phoneNumber;
  viewModel.address.text = user.address;
  viewModel.role.text = user.role;
  viewModel.status.text = user.status;
  viewModel.createdDate.text = user.date;
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    context: context,
    builder: (_) {
      return AlertDialog(
        elevation: 10.0,
        backgroundColor: AppColor.white,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: TextDesign(
                text: 'Done',
                color: AppColor.whiteColor,
              ),
              onPressed: () async {
                if (isEdit == true) {
                  try {
                    await viewModel.updateUser(user.userId.toString(), context);
                    await viewModel.fetchUserFromApi();
                    Navigator.pushNamed(context, RouteName.usermanagement);
                  } catch (e) {
                    Navigator.pop(context);
                    ToastUtils().showCherryToast(context, 'User update Unsuccessfull', true);
                  }
                } else {
                  Navigator.pop(context);
                }
              })
        ],
        title: const Center(
          child: TextDesign(
            text: 'User Information',
            fontweight: FontWeight.w900,
            fontsize: 24,
          ),
        ),
        content: Container(
          color: AppColor.white,
          //  decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(AssetsPath.signinBg),
          //       fit: BoxFit.fill,
          //       filterQuality: FilterQuality.high)),
          width: 600,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.userId,
                          title: 'User ID',
                          enable: false,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.userName,
                          title: 'Full Name',
                          enable: isEdit ? true : false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.email,
                          title: 'Email Address',
                          enable: isEdit ? true : false,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.phoneNo,
                          title: 'Contact No.',
                          enable: isEdit ? true : false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.address,
                          title: 'Mailing Address',
                          enable: isEdit ? true : false,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.status,
                          title: 'Activity Status',
                          enable: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextDesign(
                              text: 'Role Type',
                              fontweight: FontWeight.w700,
                              fontsize: 18,
                              color: AppColor.darkColor,
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 90,
                            child: CustomDropdown(
                              values: user.role,
                              data: const ['ADMIN', 'USER'],
                              hintText: 'Select Role',
                              roledropdown: true,
                              onChanging: isEdit? (newValue) {
                                viewModel.role.text = newValue!;
                                viewModel.selectRole = newValue;
                              }:null
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: CustomFields(
                          controller: viewModel.createdDate,
                          title: 'CreatedAt',
                          enable: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void userDelete(
  BuildContext context,
  AppUser user,
  UserViewModel viewModel,
) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          elevation: 10.0,
          backgroundColor: AppColor.whiteColor,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: TextDesign(
                text: 'OK',
                color: AppColor.whiteColor,
              ),
              onPressed: () async {
                try {
                  await viewModel.deleteUser(user.userId.toString(), context);
                  Navigator.pushNamed(context, RouteName.usermanagement);
                } catch (e) {
                  Navigator.pop(context);
                  ToastUtils().showCherryToast(context, 'User Delete Unsuccessfull', true);
                }
              },
            ),
          ],
          title: Text('Delete User ${user.username}'),
          content: const Text("Are you sure to delete this user"),
        );
      });
}
