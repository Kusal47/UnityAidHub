import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../view_model/page_section_view_Model.dart';
import '../../../widgets/title_richText_page.dart';
import '../../../widgets/document_upload.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class PagesSection extends StatefulWidget {
  const PagesSection({super.key});

  @override
  State<PagesSection> createState() => _PagesSectionState();
}

class _PagesSectionState extends State<PagesSection> {

  var borderColor = AppColor.borderColor;
  var width = 1.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PageSectionViewModel>(context);
    Size size = MediaQuery.of(context).size;

    return MyScaffold(
      route: RouteName.pagesection,
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
                        formKey: viewModel.formKeys,
                        nextPage: () {
                          viewModel.titleAndDesc(context, viewModel.formKeys);
                        },
                        previousPage: () =>  viewModel.pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        quillC: viewModel.psquillcontroller,
                        controller: viewModel.pstitlecontroller,
                        titleType: 'Pages',
                      );
                    case 1:
                      return DocumentUploads(
                        fileBytesList: viewModel.fileBytesList,
                        fileNamesList: viewModel.fileNamesList,
                        onTap: () {
                          viewModel.pickFiles(context);
                        },
                        title: 'Image',
                        isPage: true,
                        titleType: 'Pages',
                        nextPage: () {
                          viewModel.submitPost(context);
                        },
                        previousPage: () =>  viewModel.pageController.previousPage(
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
}
