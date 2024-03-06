import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import 'package:unity_admin/widgets/category_image_upload.dart';
import '../../../Models/category_model.dart';
import '../../../core/routes/routes_name.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../../../utils/toast_utils.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

// list of Category

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      route: RouteName.category,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextDesign(
                    text: 'Create Category',
                    fontweight: FontWeight.w700,
                    fontsize: 18,
                  ),
                  Divider(
                    color: AppColor.primaryColor,
                    thickness: 2,
                    indent: size.width * 0.01,
                    endIndent: size.width * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFields(
                              title: 'Category Name',
                              controller: viewModel.categoryController,
                              hinttext: "Enter Category Name",
                              labeltext: "Category",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, top: 16.0),
                              child: TextDesign(
                                text: 'Upload Category Image',
                                fontweight: FontWeight.w700,
                                fontsize: 18,
                                color: AppColor.darkColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, top: 8.0),
                              child: TextDesign(
                                text: 'Upload imperative image of category',
                                fontsize: 12,
                                color: AppColor.textColor,
                              ),
                            ),
                            CategoryImages(
                              text: 'Dark',
                                onTap: () {
                                  viewModel.pickFiles(context);
                                },
                                fileBytesList: viewModel.fileBytesList,
                                fileNamesList: viewModel.fileNamesList),
                            CategoryImages(text: 'Light',
                                onTap: () {
                                  viewModel.pickFiles2(context);
                                },
                                fileBytesList: viewModel.fileBytesList2,
                                fileNamesList: viewModel.fileNamesList2),
                            CategoryImages(text: 'Primary',
                                onTap: () {
                                  viewModel.pickFiles3(context);
                                },
                                fileBytesList: viewModel.fileBytesList3,
                                fileNamesList: viewModel.fileNamesList3),
                            ButtonFields(
                              onTap: () {
                                viewModel.addCategory(context);
                              },
                              txtColor: AppColor.whiteColor,
                              text: 'Create Category',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
