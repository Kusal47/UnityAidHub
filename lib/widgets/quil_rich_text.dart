import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../core/theme/app_color.dart';

class QuillBox extends StatelessWidget {
  const QuillBox({super.key, required this.controller, this.notPost = false, required this.placeHolder});
  final quill.QuillController controller;
  final bool notPost;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // QuillController controller = QuillController.basic();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColor.borderColor)),
          child: quill.QuillToolbar.simple(
            configurations: quill.QuillSimpleToolbarConfigurations(
              fontSizesValues: const {
                '10': '10.0',
                '11': '11.0',
                '12': '12.0',
                '16': '16.0',
                '18': '18.0',
                '20': '20.0',
                '22': '22.0',
                '24': '24.0',
                '26': '26.0',
                '28': '28.0',
                '30': '30.0',
                '35': '35.0',
                '40': '40.0'
              },
              toolbarIconAlignment: WrapAlignment.start,
              toolbarSectionSpacing: notPost?18:10,
              controller: controller,
              sharedConfigurations: const quill.QuillSharedConfigurations(
                locale: Locale('en'),
              ),
              showSearchButton: false,
              showListCheck: false,
              showBackgroundColorButton: false,
              showSmallButton: false,
              showStrikeThrough: false,
              showFontFamily: false,
              showFontSize: false,
              showSuperscript: false,
              showSubscript: false,
              showQuote: false,
              showColorButton: false,
              showDirection: false,
              showCodeBlock: false,
              showDividers: false,
              showIndent: false,
              showInlineCode: false,
              showAlignmentButtons: notPost ? true : false,
              showJustifyAlignment: notPost ? true : false,
              showLeftAlignment: notPost ? true : false,
              showRightAlignment: notPost ? true : false,
              showCenterAlignment: notPost ? true : false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: quill.QuillEditor.basic(
            configurations: quill.QuillEditorConfigurations(
              textSelectionControls: DesktopTextSelectionControls(),
              enableSelectionToolbar: true,
              customStyles: quill.DefaultStyles(
                placeHolder: quill.DefaultTextBlockStyle(
                    TextStyle(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Montserrat',
                        color: AppColor.textColor),
                    const quill.VerticalSpacing(0, 0),
                    const quill.VerticalSpacing(0, 0),
                    null),
              ),
              showCursor: true,
              placeholder: placeHolder,
              scrollable: true,
              scrollPhysics: const ClampingScrollPhysics(),
              textCapitalization: TextCapitalization.sentences,
              controller: controller,
              readOnly: false,
              minHeight: size.height * 0.12,
              sharedConfigurations: const quill.QuillSharedConfigurations(
                locale: Locale('en'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
