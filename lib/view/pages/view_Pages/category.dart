import 'package:flutter/material.dart';
import '../../../core/routes/routes_name.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: RouteName.category,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextDesign(
              text: 'Create Category',
              fontweight: FontWeight.w700,
              fontsize: 24,
            ),
            const SizedBox(height: 20),
            // Add form fields or widgets to create categories
            // Example: TextFields, Buttons, etc.
            // Modify this part according to your requirements
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to create a category
                // This button will trigger the category creation action
              },
              child: const Text('Create Category'),
            ),
          ],
        ),
      ),
    );
  }
}
