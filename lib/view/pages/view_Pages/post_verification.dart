import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';

import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class PostVerification extends StatelessWidget {
  const PostVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        route: RouteName.postverify,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: const TextDesign(
              text: 'Post Verification',
              fontweight: FontWeight.w700,
              fontsize: 24,
            )),
            Card(
              child: Container(
                width: 500,
                height: 200,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text('image')
                    ],
                  ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    children: [
                      Text('Campaign title'),
                      Text('Datetime')
                    ],
                  ),
                   Row(
                        children: [
                          Text('Category'),
                          Text('Country')
                        ],
                      ),
                      Text('Description')
                 ],)
               
                ,Column(children: [
                    Icon(Icons.edit),
                    Icon(Icons.delete)
                  ]),
                ],)
                  
                  
                  
                  
                  
                  
                
                  
                  ),
            )]));
  }
}
