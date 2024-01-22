import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view_model/category_view_model.dart';
import '../../../core/routes/routes_name.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}

// list of Category
List<Category> categoryList = [];

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController editingController = TextEditingController();
  bool isEdit = false;
  int editingIndex = -1;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);

    return MyScaffold(
      route: RouteName.category,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 20),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            controller: isEdit && categoryList.isNotEmpty
                                ? editingController
                                : viewModel.categoryController,
                            hinttext: "Category Name",
                            labeltext: "Category Name",
                          ),
                          const SizedBox(height: 30),
                          ButtonFields(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (isEdit) {
                                  // Editing existing category
                                  setState(() {
                                    categoryList[editingIndex] = Category(
                                      id: categoryList[editingIndex].id,
                                      name: editingController.text,
                                    );
                                    isEdit = false;
                                  });
                                } else {
                                  // Adding new category
                                  int index = categoryList.isNotEmpty
                                      ? categoryList
                                              .map((category) => category.id)
                                              .reduce((value, element) =>
                                                  value > element
                                                      ? value
                                                      : element) +
                                          1
                                      : 1;

                                  Category newCategory = Category(
                                    id: index,
                                    name: viewModel.categoryController.text,
                                  );
                                  setState(() {
                                    categoryList.add(newCategory);
                                  });

                                  viewModel.addCategory(context);
                                }
                              }
                            },
                            txtColor: AppColor.whiteColor,
                            text:
                                isEdit ? 'Update Category' : 'Create Category',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            categoryList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 600,
                        child: DataTable(
                          border:
                              TableBorder.all(color: Colors.black, width: 2),
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => AppColor.secondaryColor),
                          columns: const [
                            DataColumn(
                                label: TextDesign(
                                  text: 'S.N.',
                                  fontweight: FontWeight.w600,
                                  fontsize: 16,
                                  textAlign: TextAlign.center,
                                ),
                                numeric: true),
                            DataColumn(
                                label: TextDesign(
                              text: 'ID',
                              fontweight: FontWeight.w600,
                              fontsize: 16,
                            )),
                            DataColumn(
                                label: TextDesign(
                              text: 'Categories',
                              fontweight: FontWeight.w600,
                              fontsize: 16,
                            )),
                            DataColumn(
                                label: TextDesign(
                              text: 'Actions',
                              fontweight: FontWeight.w600,
                              fontsize: 16,
                            )),
                          ],
                          rows: List.generate(
                            categoryList.length,
                            (index) => DataRow(cells: [
                              DataCell(Text('${index + 1.toInt()}')),
                              DataCell(Text(categoryList[index].id.toString())),
                              DataCell(
                                  Text(categoryList[index].name.toUpperCase())),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit_square),
                                    onPressed: () {
                                      // Start editing
                                      setState(() {
                                        editingIndex = index;
                                        editingController.text =
                                            categoryList[index].name;
                                        isEdit = true;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColor.redColor,
                                    ),
                                    onPressed: () {
                                      // Implement delete Category logic
                                      setState(() {
                                        categoryList.removeAt(index);
                                        isEdit = false;
                                      });
                                    },
                                  ),
                                ],
                              )),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
