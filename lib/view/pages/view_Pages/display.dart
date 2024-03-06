import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Models/category_model.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../utils/text_design.dart';
import '../../../view_model/category_view_model.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
 @override
void initState() {
  super.initState();
  Provider.of<CategoryViewModel>(context, listen: false).fetchCategories();
}


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
                    text: 'Categories',
                    fontweight: FontWeight.w700,
                    fontsize: 18,
                  ),
                  Divider(
                    color: AppColor.primaryColor,
                    thickness: 2,
                    indent: size.width * 0.01,
                    endIndent: size.width * 0.01,
                  ),
                  SizedBox(
                    height: size.height, // Adjust the height as needed
                    child: ListView.builder(
                      itemCount: viewModel.fetchedCategories.length,
                      itemBuilder: (context, index) {
                        CategoryData category = viewModel.fetchedCategories[index];
                        return ListTile(
                          title: Text(category.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${category.id}'),
                              Text('Title: ${category.name}'),
                              Text('Created At: ${category.createdAt}'),
                              Text('Updated At: ${category.updatedAt}'),
                              SizedBox(height: 8),
                              // Text('Images:'),
                              // if (category.darkImage != null)
                              //   Image.network('${ApiUrl.baseUrl}${category.darkImage}'),
                              // if (category.lightImage != null)
                              //   Image.network('${ApiUrl.baseUrl}${category.lightImage}'),
                              // if (category.primaryImage != null)
                              //   Image.network('${ApiUrl.baseUrl}${category.primaryImage}'),
                            ],
                          ),
                        );
                      },
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
