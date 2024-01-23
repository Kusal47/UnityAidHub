import 'package:flutter/material.dart';
import 'package:unity_admin/core/const/assets_path.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/core/theme/app_color.dart';

import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';
class PostVerification extends StatelessWidget {
  const PostVerification({Key? key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: RouteName.postverify,
      body: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 700,
          height: 900,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          AssetsPath.portraitdarklogo,height: 80,
                        ),
                      ),
                      const Expanded(
                        flex: 6,
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.symmetric(vertical:8.0),
                            child: TextDesign(
                              text:
                                  'My Little Boy Can’t Breathe, And I’m Helpless. Please Save Him For Me.',
                              fontsize: 14,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          subtitle: TextDesign(
                            text:
                                'Anjuli Mehrotras love for her husband, Vidhi, knows no bounds. Faced with Vidhis critical liver condition, Anjuli, alongside their daughter Vidha, is embarking on an extraordinary journey of hope and sacrifice. Vidha, a beacon of compassion, has selflessly chosen to donate her liver to save her father\'s life. This family\'s resilience is both heartwarming and awe-inspiring, but the road to recovery is paved with financial challenges. Anjuli is reaching out to our community for support as they navigate the expenses associated with Vidhi\'s liver transplant. In the spirit of collective compassion, let\'s join hands to ease the financial burden on the Mehrotra family. Every contribution to the Mehrotra Liver Transplant Fund is a gesture of hope, helping to ensure Vidhi\'s second chance at life. To contribute and be a part of this life-changing journey, Together, we can make a difference and show the world the strength of community and the power of familial love. Thank you for being a source of light in the Mehrotra family\'s darkest hour.',
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          trailing: TextDesign(
                            text: '2024-10-10',
                            fontsize: 14,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: AppColor.darkColor,
                          child: const Icon(Icons.arrow_right_alt_outlined),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
