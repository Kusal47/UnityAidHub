import 'dart:typed_data';

import 'package:country_picker/country_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/resources/custom_dropdown.dart';
import '../../../data/lists.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../../../view_model/add_post_view_model.dart';
import '../AdminScaffold/admin_scaffold_page.dart';
import 'package:path/path.dart' as path;

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  var borderColor = AppColor.borderColor;
  var width = 1.0;
  List<Uint8List> _fileBytesList = [];
  List<String> _fileNamesList = [];

  void _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<Uint8List> bytesList =
          result.files.map((file) => file.bytes!).toList();
      List<String> namesList = result.files.map((file) => file.name!).toList();

      setState(() {
        _fileBytesList.addAll(bytesList);
        _fileNamesList.addAll(namesList);
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddPostViewModel>(context);
    Size size = MediaQuery.of(context).size;

    return MyScaffold(
      route: RouteName.postadd,
      body: SizedBox(
        height: size.height,
        child: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return buildCategoryFundingPage(
                  context,
                  viewModel,
                  formKey: formKeys[0],
                  nextPage: () {
                    if (formKeys[0].currentState!.validate() &&
                        viewModel.selectedCategory != null &&
                        viewModel.selectedCountry.isNotEmpty) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  previousPage: () => {},
                );
              case 1:
                return buildBeneficiaryInformationPage(
                  context,
                  viewModel,
                  nextPage: () {
                    if (viewModel.selectedBenificiary.isNotEmpty) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  previousPage: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                );
              case 2:
                return buildCampaignDetailsPage(
                  context,
                  viewModel,
                  formKey: formKeys[1],
                  nextPage: () {
                    if (formKeys[1].currentState!.validate() &&
                        !viewModel.quillcontroller.document.isEmpty()) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  previousPage: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                );
              case 3:
                return buildDocumentUploadPage(
                  context,
                  viewModel,
                  nextPage: () {
                    if (_fileBytesList.isNotEmpty &&
                        _fileNamesList.isNotEmpty) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  previousPage: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                );
              case 4:
                return buildTermsPage(
                  context,
                  viewModel,
                  nextPage: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  previousPage: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                );
              default:
                return Container(); // Handle additional pages if needed
            }
          },
          itemCount: 5, // Number of pages
        ),
      ),
    );
  }

  Widget buildCategoryFundingPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required GlobalKey<FormState> formKey,
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
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
                      hintText: 'Select Category',
                      onChanged: (value) {
                        setState(() {
                          viewModel.selectedCategory = value!;
                          print(viewModel.selectedCategory);
                        });
                      },
                      data: categoryList,
                      fontSize: 12,
                      values: viewModel.selectedCategory,
                    ),
                  ),
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
              padding: const EdgeInsets.all(8.0),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)))),
                      onPressed: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.borderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor,
                                      width: 2.0),
                                ),
                              ),
                            ),
                            favorite: ['NP'],
                            showPhoneCode: false,
                            onSelect: (Country? country) {
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
                      text:
                          'This country will be used to dispaly where benificiary belongs to.',
                      // fontStyle: FontStyle.italic,
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextDesign(
                      text: 'Target Funding',
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomFields(
                      controller: viewModel.fundController,
                      isNumber: true,
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
              viewModel,
              nextPage: nextPage,
              previousPage: previousPage,
              isIndexFirst: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBeneficiaryInformationPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
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
                  subtitle:
                      'You will be receiving funds to your Bank account from the campaign',
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
            viewModel,
            nextPage: nextPage,
            previousPage: previousPage,
          ),
        ],
      ),
    );
  }

  Widget buildCampaignDetailsPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required GlobalKey<FormState> formKey,
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                child: TextDesign(
                  text: 'Campaign Details',
                  fontweight: FontWeight.w700,
                  fontsize: 18,
                  color: AppColor.darkColor,
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextDesign(
                        text: 'Title for The Campaign',
                        fontweight: FontWeight.w700,
                        fontsize: 18,
                        color: AppColor.darkColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomFields(
                        controller: viewModel.titlecontroller,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: TextDesign(
                        text: 'Choose a suitable Title for your campaign',
                        // fontStyle: FontStyle.italic,
                        fontsize: 12,
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextDesign(
                        text: 'Description',
                        fontweight: FontWeight.w700,
                        fontsize: 18,
                        color: AppColor.darkColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextDesign(
                        text: 'Describe about benificiary for your campaign',
                        // fontStyle: FontStyle.italic,
                        fontsize: 12,
                        color: AppColor.textColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColor.borderColor)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: AppColor.borderColor)),
                              child: QuillToolbar.simple(
                                configurations:
                                    QuillSimpleToolbarConfigurations(
                                  toolbarIconAlignment: WrapAlignment.start,
                                  controller: viewModel.quillcontroller,
                                  sharedConfigurations:
                                      const QuillSharedConfigurations(
                                    locale: Locale('en'),
                                  ),
                                  showSearchButton: false,
                                  showListCheck: false,
                                  showAlignmentButtons: true,
                                  showSmallButton: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuillEditor.basic(
                                configurations: QuillEditorConfigurations(
                                  enableSelectionToolbar: true,
                                  customStyles: DefaultStyles(
                                    placeHolder: DefaultTextBlockStyle(
                                        TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Montserrat',
                                            color: AppColor.textColor),
                                        const VerticalSpacing(0, 0),
                                        const VerticalSpacing(0, 0),
                                        null),
                                  ),
                                  showCursor: true,
                                  placeholder:
                                      "Something about benificiary....",
                                  scrollable: true,
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: viewModel.quillcontroller,
                                  readOnly: false,
                                  minHeight: size.height * 0.12,
                                  sharedConfigurations:
                                      const QuillSharedConfigurations(
                                    locale: Locale('en'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildNavigationButtons(
                context,
                viewModel,
                nextPage: nextPage,
                previousPage: previousPage,
              ),
              Container(
                child: Text(viewModel.quillcontroller.document.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDocumentUploadPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 8),
            child: TextDesign(
              text: 'Document Upload',
              fontweight: FontWeight.w700,
              fontsize: 18,
              color: AppColor.darkColor,
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
              child: Container(
                  // color: AppColor.redColor,
                  width: size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                          child: TextDesign(
                            text: 'Upload Documents',
                            fontweight: FontWeight.w700,
                            fontsize: 18,
                            color: AppColor.darkColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                          child: TextDesign(
                            text:
                                'Upload imperative documents of your campaign',
                            fontsize: 12,
                            color: AppColor.textColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: size.width * 0.15,
                                  child: MouseRegion(
                                    cursor: MaterialStateMouseCursor.clickable,
                                    child: GestureDetector(
                                      onTap: _pickFiles,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            shape: BoxShape.rectangle,
                                            color: AppColor.lightgreyColor),
                                        child: const Text('Choose Files'),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: TextDesign(
                                  text: _fileBytesList.isEmpty
                                      ? 'No files chosen'
                                      : 'Choose more Files',
                                ),
                              ),
                            ],
                          ),
                        ),
                        _fileBytesList.isNotEmpty
                            ? SizedBox(
                                height: _fileBytesList.isNotEmpty
                                    ? size.height * 0.23
                                    : null,
                                child: GridView.builder(
                                  itemCount: _fileBytesList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        TextDesign(text:_fileNamesList.isEmpty
                                              ? ''
                                              : _fileNamesList[index],
                                                fontsize: 12
                                              
                                        ),
                                        Image.memory(
                                          _fileBytesList[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    );
                                  },
                                  physics: const ClampingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 1.05,
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.2,
                                child: ButtonFields(
                                  onTap: () {},
                                  txtColor: AppColor.whiteColor,
                                  text: 'Upload',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
          buildNavigationButtons(
            context,
            viewModel,
            nextPage: nextPage,
            previousPage: previousPage,
          ),
        ]));
  }

  Widget buildTermsPage(
    BuildContext context,
    AddPostViewModel viewModel, {
    required VoidCallback nextPage,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
                      onChanged: (value) {},
                      value: false,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: TextDesign(
                    text: 'I hereby agrees all the terms and Conditions',
                    fontsize: 12,
                    // color: AppColor.textColor,
                  ),
                ),
              ],
            ),
          ),
          buildNavigationButtons(context, viewModel,
              nextPage: nextPage,
              previousPage: previousPage,
              isIndexLast: true),
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
                width: viewModel.selectedBenificiary == selectedBenificiary
                    ? 2
                    : 1,
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

Widget buildNavigationButtons(
  BuildContext context,
  AddPostViewModel viewModel, {
  required VoidCallback nextPage,
  required VoidCallback previousPage,
  bool isIndexFirst = false,
  bool isIndexLast = false,
}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.14,
          child: ButtonFields(
            onTap: previousPage,
            btnColor:
                isIndexFirst ? AppColor.borderColor : AppColor.secondaryColor,
            txtColor: isIndexFirst ? AppColor.darkColor : AppColor.whiteColor,
            text: '',
            isPrev: true,
            fontsize: 12,
            fontweight: FontWeight.w100,
          ),
        ),
        SizedBox(
          width: size.width * 0.14,
          child: ButtonFields(
            onTap: nextPage,
            txtColor: AppColor.whiteColor,
            text: isIndexLast ? 'Submit' : '',
            isNext: isIndexLast ? false : true,
            // isLast: ,
            fontsize: 14,
          ),
        ),
      ],
    ),
  );
}
