import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import '../../../core/routes/routes_name.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return MyScaffold(
      route: RouteName.category,
      body: Card(
        color:AppColor.greyColor ,
        margin: const EdgeInsets.symmetric(vertical: 120),
        shadowColor: Colors.grey[0],
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 500,
            height: 300,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextDesign(
                    text: 'Create Category',
                    fontweight: FontWeight.w700,
                    fontsize: 24,
                  ),
                  const SizedBox(height: 20),
                  CustomFields(
                    controller: viewModel.categoryController,
                    hinttext: "Category Name",
                    labeltext: "Category Name",
                  ),
                  const SizedBox(height: 20),
                  ButtonFields(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        viewModel.addCategory(context);
                      }
                    },
                    txtColor: AppColor.whiteColor,
                    text: 'Create Category',
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
