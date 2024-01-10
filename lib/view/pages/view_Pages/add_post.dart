import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import '../../../resources/texfields_pages.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();
    TextEditingController titlecontroller = TextEditingController();
    return MyScaffold(
      route: RouteName.postadd,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        controller: titlecontroller,
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
                                  controller: controller,
                                  sharedConfigurations:
                                      const QuillSharedConfigurations(
                                    locale: Locale('en'),
                                  ),
                                  showSearchButton: false,
                                  showListCheck: false,
                                  showAlignmentButtons: true,
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
                                  placeholder: "Enter about benificiary....",
                                  scrollable: true,
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  minHeight: 200,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: controller,
                                  readOnly: false,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: SizedBox(
                  width: 200,
                  child: ButtonFields(
                    txtColor: AppColor.whiteColor,
                    text: 'Add Post',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
