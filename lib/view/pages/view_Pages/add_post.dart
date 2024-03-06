import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/Models/category_model.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/resources/custom_dropdown.dart';
import 'package:unity_admin/utils/country_picker.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import 'package:unity_admin/view_model/login_signup_view_model.dart';
import 'package:unity_admin/widgets/document_upload.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/dialog_box.dart';
import '../../../utils/text_design.dart';
import '../../../view_model/add_post_view_model.dart';
import '../../../widgets/title_richText_page.dart';
import '../../../widgets/navigating_buttons.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  var borderColor = AppColor.borderColor;
  var width = 1.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddPostViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
        route: RouteName.postadd,
        body: Consumer3<AddPostViewModel, CategoryViewModel, LoginViewModel>(
            builder: (context, addPost, categoryVM, loginVM, _) {
          return SingleChildScrollView(
            child: Center(
              child: SizedBox(
                height: size.height * 0.9,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return buildCategoryFundingPage(
                            context,
                            viewModel,
                            formKey: viewModel.formKeys[0],
                            nextPage: ()  {
                              viewModel.categoryAndFunding(context, viewModel.formKeys[0]);
                              print(
                                viewModel.preCurrency + viewModel.fundController.text,
                              );
                            },
                            previousPage: () => {},
                          );
                        // case 1:
                        //   return buildBeneficiaryInformationPage(
                        //     context,
                        //     viewModel,
                        //     nextPage: () {
                        //       viewModel.beneficiary(context);
                        //     },
                        //     previousPage: () => viewModel.pageController.previousPage(
                        //       duration: const Duration(milliseconds: 300),
                        //       curve: Curves.easeInOut,
                        //     ),
                        //   );
                        case 1:
                          return CommonBuildPages(
                            addPost: true,
                            formKey: viewModel.formKeys[1],
                            nextPage: () {
                              viewModel.titleAndDesc(context, viewModel.formKeys[1]);
                            },
                            previousPage: () => viewModel.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            desccontroller: viewModel.desccontroller,
                            controller: viewModel.titlecontroller,
                            titleType: 'Campaign',
                            viewModel: viewModel,
                          );
                        case 2:
                          return DocumentUploads(
                            fileBytesList: viewModel.fileBytesList,
                            fileNamesList: viewModel.fileNamesList,
                            title: 'Document',
                            titleType: 'Campaign',
                            onTap: () {
                              viewModel.pickFiles(context);
                            },
                            nextPage: () {
                              viewModel.documentUpload(context);
                            },
                            previousPage: () => viewModel.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                          );
                        case 3:
                          return DocumentUploads(
                            fileBytesList: viewModel.fileBytesList1,
                            fileNamesList: viewModel.fileNamesList1,
                            title: 'Image',
                            titleType: 'Campaign',
                            onTap: () {
                              viewModel.pickFiles(context, isImage: true);
                            },
                            nextPage: () {
                              viewModel.documentUpload(context);
                            },
                            previousPage: () => viewModel.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                          );

                        case 4:
                          return buildTermsPage(
                            context,
                            viewModel,
                            submitDetails: () async {
                              print('submitted');
                              print(viewModel.selectedCategory!.id);   
                             await viewModel.submitPost(
                                    context,
                                    viewModel.selectedCategory!.id,
                                  );
                              
                            },
                            previousPage: () => viewModel.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                          );
                        default:
                          return Container();
                      }
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ),
          );
        }));
  }

Widget buildCategoryFundingPage(
  BuildContext context,
  AddPostViewModel viewModel, {
  required GlobalKey<FormState> formKey,
  required VoidCallback nextPage,
  required VoidCallback previousPage,
}) {
  Size size = MediaQuery.of(context).size;
  return Consumer<CategoryViewModel>(builder: (context, categoryViewModel, _) {
    List<CategoryData> categoryList = categoryViewModel.fetchedCategories;
 

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextDesign(
                text: 'Category & Funding Details',
                fontweight: FontWeight.w600,
                fontsize: 18,
                color: AppColor.darkColor,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: AppColor.primaryColor,
              thickness: 2,
              indent: size.width * 0.01,
              endIndent: size.width * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextDesign(
                      text: 'Select a category',
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomDropdown(
                        value: viewModel.selectedCategory,
                        onChanged: (CategoryData? value) {
                          viewModel.selectedCategory = value!;
                        },
                        items: categoryList,
                        category: true,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text: 'Choose a suitable Category for your campaign',
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextDesign(
                      text: 'Country',
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColor.darkColor,
                        padding: const EdgeInsets.all(10),
                        side: BorderSide(color: borderColor, width: width),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      ),
                      onPressed: () {
                        CountryPickerUtils().pickCountry(context, () {}, (Country? country) {
                          setState(() {
                            viewModel.selectedCountry = country!.name;
                          });
                        });

                        setState(() {
                          borderColor = AppColor.secondaryColor;
                          width = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              viewModel.selectedCountry.isNotEmpty
                                  ? viewModel.selectedCountry
                                  : 'Select Country',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.unfold_more),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text: 'This country will be used to dispaly where benificiary belongs to.',
                      // fontStyle: FontStyle.italic,
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomFields(
                      title: 'Target Funding',
                      controller: viewModel.fundController,
                      isNumber: true,
                      hinttext: '0.00',
                      onChanged: (value) {
                        setState(() {
                          viewModel.selectedCurrency = value;
                        });
                        viewModel.currencySymbol(context);
                      },
                      selectedCurrency: viewModel.preCurrency,
                      // labeltext: 'Enter Required Amount',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text: 'Place require fund you want to raise.',
                      // fontStyle: FontStyle.italic,
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            buildNavigationButtons(
              context,
              nextPage: nextPage,
              previousPage: previousPage,
              isIndexFirst: true,
            ),
          ],
        ),
      ),
    );
  });
}

  Widget buildBeneficiaryInformationPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 8),
            child: TextDesign(
              text: 'Beneficiary Information',
              fontweight: FontWeight.w700,
              fontsize: 18,
              color: AppColor.darkColor,
              textAlign: TextAlign.center,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: TextDesign(
                    text: 'Beneficiary',
                    fontweight: FontWeight.w700,
                    fontsize: 18,
                    color: AppColor.darkColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: TextDesign(
                    text: 'Choose a beneficiary for your campaign',
                    fontsize: 12,
                    color: AppColor.textColor,
                  ),
                ),
                buildBeneficiaryTile(
                  title: 'Myself',
                  subtitle: 'You will be receiving funds to your Bank account from the campaign',
                  selectedBenificiary: 'MySelf',
                  viewModel: viewModel,
                ),
                buildBeneficiaryTile(
                  title: 'Someone Else',
                  subtitle:
                      'Beneficiary will be receiving funds to their Bank account from the campaign',
                  selectedBenificiary: 'Someone Else',
                  viewModel: viewModel,
                ),
                buildBeneficiaryTile(
                  title: 'Registered Non-Profit Organization',
                  subtitle:
                      'Organization will be receiving funds to their Bank account from the campaign',
                  selectedBenificiary: 'Non-Profit Organization',
                  viewModel: viewModel,
                ),
              ],
            ),
          ),
          buildNavigationButtons(
            context,
            nextPage: nextPage,
            previousPage: previousPage,
          ),
        ],
      ),
    );
  }

  Widget buildTermsPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required VoidCallback submitDetails,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 8),
            child: TextDesign(
              text: 'Terms And Conditions',
              fontweight: FontWeight.w700,
              fontsize: 18,
              color: AppColor.darkColor,
              textAlign: TextAlign.center,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Checkbox(
                      activeColor: AppColor.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          viewModel.isChecked = value!;
                        });
                      },
                      value: viewModel.isChecked,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text.rich(
                      selectionColor: AppColor.secondaryColor,
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'I hereby agree with ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'User Agreement',
                            mouseCursor: MouseCursor.defer,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle User Agreement link tap
                                // You can navigate to the User Agreement screen or open a web page.
                              },
                          ),
                          const TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy policy',
                            mouseCursor: MouseCursor.defer,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle User Agreement link tap
                                // You can navigate to the User Agreement screen or open a web page.
                              },
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          buildNavigationButtons(context,
              nextPage: submitDetails, previousPage: previousPage, isIndexLast: true),
        ],
      ),
    );
  }

  Widget buildBeneficiaryTile({
    required String title,
    required String subtitle,
    required String selectedBenificiary,
    required AddPostViewModel viewModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            viewModel.selectedColor = AppColor.secondaryColor;
            viewModel.selectedBenificiary = selectedBenificiary;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: viewModel.selectedBenificiary == selectedBenificiary ? 2 : 1,
                color: viewModel.selectedBenificiary == selectedBenificiary
                    ? viewModel.selectedColor
                    : AppColor.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: TextDesign(
                    text: title,
                    fontweight: FontWeight.w600,
                  ),
                  subtitle: TextDesign(
                    text: subtitle,
                    color: AppColor.textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
