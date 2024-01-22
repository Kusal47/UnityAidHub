import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/view_model/blog_section_view_model.dart';
import 'package:unity_admin/widgets/title_richText_page.dart';
import '../../../core/theme/app_color.dart';
import '../../../data/lists.dart';
import '../../../resources/custom_dropdown.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/text_design.dart';
import '../../../widgets/document_upload.dart';
import '../../../widgets/navigating_buttons.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  var borderColor = AppColor.borderColor;
  var width = 1.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BlogSectionViewModel>(context);
    Size size = MediaQuery.of(context).size;

    return MyScaffold(
      route: RouteName.blogs,
      body: SingleChildScrollView(
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
                      return CommonBuildPages(
                        formKey: viewModel.formKeys[0],
                        nextPage: () {
                          viewModel.titleAndDesc(
                              context, viewModel.formKeys[0]);
                        },
                        previousPage: () =>
                            viewModel.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        quillC: viewModel.bsquillcontroller,
                        controller: viewModel.bstitlecontroller,
                        titleType: 'Blog',
                      );
                    case 1:
                      return DocumentUploads(
                        fileBytesList: viewModel.fileBytesList,
                        fileNamesList: viewModel.fileNamesList,
                        onTap: () {
                          viewModel.pickFiles(context);
                        },
                        titleType: 'Blog',
                        title: 'Image',
                        nextPage: () {
                          viewModel.documentUpload(context);
                        },
                        previousPage: () =>
                            viewModel.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                      );

                    case 2:
                      return buildAuthorNamePage(
                        context,
                        viewModel,
                        formKey: viewModel.formKeys[1],
                        submitDetails: () {
                          viewModel.submitPost(context, viewModel.formKeys[1]);
                        },
                        previousPage: () =>
                            viewModel.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                      );
                    default:
                      return Container(); // Handle additional pages if needed
                  }
                },
                itemCount: 3, // Number of pages
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAuthorNamePage(
    BuildContext context,
    BlogSectionViewModel viewModel, {
    required GlobalKey<FormState> formKey,
    required VoidCallback submitDetails,
    required VoidCallback previousPage,
  }) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8),
              child: TextDesign(
                text: 'Author Details',
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
                      text: 'Author Name',
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomFields(
                      controller: viewModel.authorcontroller,
                      labeltext: 'Author Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text: 'Include author name',
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
                      text: 'Choose a suitable Category for your Blog',
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
            buildNavigationButtons(context,
                nextPage: submitDetails,
                previousPage: previousPage,
                isIndexLast: true),
          ],
        ),
      ),
    );
  }
}
