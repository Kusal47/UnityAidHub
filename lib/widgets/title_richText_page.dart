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
    required this.formKey,
    required this.nextPage,
    required this.previousPage,
    this.titleType,
    this.desccontroller,
    this.quillC,
    required this.controller,
    this.addPost = false,
    this.viewModel,
  }) ;

  final QuillController? quillC;
  final TextEditingController? desccontroller;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final String? titleType;
  final bool addPost;
  final AddPostViewModel? viewModel;

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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomFields(
                            title: 'Title for The ${widget.titleType}',
                            controller: widget.controller,
                            labeltext: 'Title',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                          child: TextDesign(
                            text: 'Choose suitable Title for ${widget.titleType}',
                            fontsize: 12,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.addPost)
                    Expanded(
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomDropdown(
                              hintText: 'Select Post Type',
                              onChanging: (value) {
                                setState(() {
                                  widget.viewModel!.postType = value!;
                                  print(widget.viewModel!.postType);
                                });
                              },
                              data: postType,
                              fontSize: 12,
                              values: widget.viewModel!.postType,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                            child: TextDesign(
                              text: 'Choose suitable Type for ${widget.titleType}',
                              fontsize: 12,
                              color: AppColor.textColor,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            if (widget.addPost)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomFields(
                  post: true,
                  title: "Description",
                  hintText: "Enter some description",
                  controller: widget.viewModel!.desccontroller,
                  canbeNull: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: (p0) {
                    if (p0!.length < 3) {
                      return "Please enter a valid Description.";
                    }
                    return null;
                  },
                ),
              )
            else
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
                        fontsize: 12,
                        color: AppColor.textColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColor.borderColor),
                        ),
                        child: QuillBox(
                          controller: widget.quillC!,
                          notPost: true,
                          placeHolder: 'Description of ${widget.titleType}...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            buildNavigationButtons(context,
                nextPage: widget.nextPage,
                previousPage: widget.previousPage,
                isIndexFirst: !widget.addPost),
          ],
        ),
      ),
    );
  }
}
