import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../data/lists.dart';
import '../../../resources/custom_dropdown.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../../../view_model/ad_management_view_Model.dart';
import '../../../widgets/category_image_upload.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class AdsManagement extends StatefulWidget {
  const AdsManagement({super.key});

  @override
  State<AdsManagement> createState() => _AdsManagementState();
}

class _AdsManagementState extends State<AdsManagement> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<AdsViewModel>(context);
    return MyScaffold(
        route: RouteName.adsmanagement,
        body: Center(
          child: SizedBox(
            width: size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 8),
                  child: TextDesign(
                    text: 'Ads Management',
                    fontweight: FontWeight.w700,
                    fontsize: 24,
                  ),
                ),
                Divider(
                  color: AppColor.primaryColor,
                  thickness: 2,
                  indent: size.width * 0.01,
                  endIndent: size.width * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: viewModel.formKeys,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomFields(
                                title: 'Ad Title',
                                controller: viewModel.adTitle,
                                labeltext: 'Title for Ads',
                                icon: Icons.check,
                                isAd: true,
                                onPressed: () {
                                  setState(() {
                                    viewModel.adTitle.text;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomFields(
                                title: 'Company Name',
                                controller: viewModel.companyName,
                                labeltext: '',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFields(
                            isDesc: true,
                            title: "Description",
                            hintText: "Enter some description",
                            controller: viewModel.description,
                            canbeNull: false,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            validator: (p0) {
                              if (p0!.length < 3) {
                                return "Please enter a valid Message";
                              }
                              return null;
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'Select a Post Type',
                                fontweight: FontWeight.w700,
                                fontsize: 18,
                                color: AppColor.darkColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomDropdown(
                                hintText: 'Select Ads Type',
                                onChanged: (value) {
                                  setState(() {
                                    viewModel.adsType = value!;
                                    print(viewModel.adsType);
                                  });
                                },
                                data: adsStyle,
                                fontSize: 12,
                                values: viewModel.adsType,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  // color: AppColor.redColor,
                                  // width: size.width * 0.5,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: TextDesign(
                                            text: 'Upload Ads Image ',
                                            fontweight: FontWeight.w700,
                                            fontsize: 18,
                                            color: AppColor.darkColor,
                                          ),
                                        ),
                                        CategoryImages(
                                            text: 'Ad',
                                            onTap: () {
                                              viewModel.pickFiles(context);
                                            },
                                            fileBytesList: viewModel.fileBytesList,
                                            fileNamesList: viewModel.fileNamesList),
                                      ]),
                                ))
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.2,
                                child: ButtonFields(
                                  onTap: () {
                                    if (viewModel.adTitle.text.isNotEmpty &&
                                        viewModel.fileBytesList.isNotEmpty &&
                                        viewModel.fileNamesList.isNotEmpty &&
                                        viewModel.description.text.isNotEmpty &&
                                        viewModel.companyName.text.isNotEmpty &&
                                        viewModel.adsType != null) {
                                      setState(() {
                                        viewModel.addAds = !viewModel.addAds;
                                        if (viewModel.addAds == false) {
                                          viewModel.adTitle.clear();
                                          viewModel.fileBytesList.clear();
                                          viewModel.fileNamesList.clear();
                                          viewModel.adsType == null;
                                        }
                                      });
                                    }
                                  },
                                  txtColor: AppColor.whiteColor,
                                  text: viewModel.addAds && viewModel.fileBytesList.isNotEmpty
                                      ? 'Cancel'
                                      : 'Preview Ad',
                                ),
                              ),
                              (viewModel.fileBytesList.isNotEmpty)
                                  ? SizedBox(
                                      width: size.width * 0.2,
                                      child: ButtonFields(
                                        onTap: () async {
                                          if (viewModel.formKeys.currentState!.validate()) {
                                            await viewModel.uploadAd(context);
                                            viewModel.adTitle.clear();
                                            viewModel.fileBytesList.clear();
                                            viewModel.fileNamesList.clear();
                                            viewModel.description.clear();
                                            viewModel.companyName.clear();
                                            viewModel.adsType == null;
                                          }
                                        },
                                        txtColor: AppColor.whiteColor,
                                        text: 'Upload Ad',
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                 viewModel.adsType == 'BANNER' &&
                        viewModel.fileBytesList.isNotEmpty &&
                        viewModel.addAds
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width * 0.5,
                          child: viewModel.fileBytesList.isNotEmpty
                              ? Image.memory(
                                  viewModel.resizeImage(
                                    viewModel.fileBytesList[0],
                                    size.width * 0.5,
                                    size.height * 0.151,
                                  ),
                                  width: size.width * 0.5,
                                  height: size.height * 0.151,
                                  fit: BoxFit.fill,
                                )
                              : const SizedBox.shrink(),
                        ))
                    : viewModel.adsType == 'CARD' &&
                            viewModel.fileBytesList.isNotEmpty &&
                            viewModel.addAds
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 20,
                                child: Image.memory(
                                  viewModel.resizeImage(
                                    viewModel.fileBytesList[0],
                                    size.width * 0.092,
                                    size.height * 0.31,
                                  ),
                                  width: size.width * 0.092,
                                  height: size.height * 0.31,
                                  fit: BoxFit.fill,
                                )),
                          )
                        : viewModel.adsType == 'HALFBANNER' &&
                                viewModel.fileBytesList.isNotEmpty &&
                                viewModel.addAds
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    child: Image.memory(
                                 viewModel.resizeImage(
                                    viewModel.fileBytesList[0],
                                    size.width * 0.228,
                                    size.height * 0.151,
                                  ),
                                  width: size.width * 0.228,
                                  height: size.height * 0.151,
                                  fit: BoxFit.fill,
                                )),
                              )
                            : const SizedBox.shrink(),
              
              ],
            ),
          ),
        ));
  }
}
