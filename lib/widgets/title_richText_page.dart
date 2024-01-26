import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:unity_admin/view_model/add_post_view_model.dart';
import '../core/theme/app_color.dart';
import '../data/lists.dart';
import '../resources/custom_dropdown.dart';
import '../resources/texfields_pages.dart';
import '../utils/text_design.dart';
import 'navigating_buttons.dart';
import 'quil_rich_text.dart';

class CommonBuildPages extends StatefulWidget {
  const CommonBuildPages({
    super.key,
    required this.formKey,
    required this.nextPage,
    required this.previousPage,
    this.titleType,
    required this.quillC,
    required this.controller,
    this.addPost = false,
    this.viewModel,
    // this.title,
    // this.subtitle,
    // this.description,
    // this.subitleNote,
    // this.descriptionNote
  });

  final QuillController quillC;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final String? titleType;
  final bool addPost;
  final AddPostViewModel? viewModel;
  // final String? subtitle;
  // final String? subitleNote;
  // final String? description;
  // final String? descriptionNote;
  @override
  State<CommonBuildPages> createState() => _CommonBuildPagesState();
}

class _CommonBuildPagesState extends State<CommonBuildPages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8),
              child: TextDesign(
                text: '${widget.titleType} Title',
                fontweight: FontWeight.w700,
                fontsize: 18,
                color: AppColor.darkColor,
                textAlign: TextAlign.center,
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
              child: size.width < 600
                  ? Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'Title for The ${widget.titleType}',
                                fontweight: FontWeight.w700,
                                fontsize: 18,
                                color: AppColor.darkColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomFields(
                                controller: widget.controller,
                                labeltext: 'Title',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: TextDesign(
                                text:
                                    'Choose a suitable Title for ${widget.titleType}',
                                fontsize: 12,
                                color: AppColor.textColor,
                              ),
                            ),
                          ],
                        ),
                        widget.addPost
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextDesign(
                                      text: 'Select a Post Type',
                                      fontweight: FontWeight.w700,
                                      fontsize: 18,
                                      color: AppColor.darkColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CustomDropdown(
                                      onChanged: (value) {
                                        setState(() {
                                          widget.viewModel!.postType = value!;
                                          print(widget.viewModel!.postType);
                                        });
                                      },
                                      data: postType,
                                      fontSize: 12,
                                      values: postType.first,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: TextDesign(
                                      text:
                                          'Choose a PostType for ${widget.titleType}',
                                      fontsize: 12,
                                      color: AppColor.textColor,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextDesign(
                                  text: 'Title for The ${widget.titleType}',
                                  fontweight: FontWeight.w700,
                                  fontsize: 18,
                                  color: AppColor.darkColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomFields(
                                  controller: widget.controller,
                                  labeltext: 'Title',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: TextDesign(
                                  text:
                                      'Choose suitable Title for ${widget.titleType}',
                                  fontsize: 12,
                                  color: AppColor.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        widget.addPost
                            ? Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextDesign(
                                        text: 'Select Post Type',
                                        fontweight: FontWeight.w700,
                                        fontsize: 18,
                                        color: AppColor.darkColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CustomDropdown(
                                        onChanged: (value) {
                                          setState(() {
                                            widget.viewModel!.postType = value!;
                                            print(widget.viewModel!.postType);
                                          });
                                        },
                                        data: postType,
                                        fontSize: 12,
                                        values: postType.first,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8.0),
                                      child: TextDesign(
                                        text:
                                            'Choose suitable Type for ${widget.titleType}',
                                        fontsize: 12,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
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
                      text: 'Describe about your ${widget.titleType}',
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
                        child: QuillBox(
                          controller: widget.quillC,
                          notPost: widget.addPost ? false : true,
                          placeHolder: widget.addPost
                              ? 'Description of Beneficiary...'
                              : 'Description of ${widget.titleType}...',
                        )),
                  ),
                ],
              ),
            ),
            buildNavigationButtons(context,
                nextPage: widget.nextPage,
                previousPage: widget.previousPage,
                isIndexFirst: widget.addPost ? false : true),
            Text(widget.quillC.document.toDelta().toString())
          ],
        ),
      ),
    );
  }
}
