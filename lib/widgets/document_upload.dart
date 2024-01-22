import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';
import '../utils/button_fields.dart';
import '../utils/text_design.dart';
import 'navigating_buttons.dart';

class DocumentUploads extends StatefulWidget {
  const DocumentUploads({
    super.key,
    required this.nextPage,
    required this.previousPage,
    this.isPage = false,
    required this.titleType,
    required this.title,
    required this.onTap,
    required this.fileBytesList,
    required this.fileNamesList,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final bool isPage;
  final String titleType;
  final String title;
  final Function() onTap;
  final List<Uint8List> fileBytesList;
  final List<String> fileNamesList;
  @override
  State<DocumentUploads> createState() => _DocumentUploadsState();
}

class _DocumentUploadsState extends State<DocumentUploads> {
   bool hovered = false;
   int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 8),
          child: TextDesign(
            text: '${widget.title} Upload',
            fontweight: FontWeight.w700,
            fontsize: 18,
            color: AppColor.darkColor,
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
            child: SizedBox(
                // color: AppColor.redColor,
                // width: size.width * 0.5,
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text: 'Upload ${widget.title} ',
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: TextDesign(
                      text:
                          'Upload imperative ${widget.title}  of your ${widget.titleType} ',
                      fontsize: 12,
                      color: AppColor.textColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: size.width <= 500
                                ? size.width * 0.3
                                : size.width * 0.1,
                            child: MouseRegion(
                              cursor: MaterialStateMouseCursor.clickable,
                              child: GestureDetector(
                                onTap: widget.onTap,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                      color: AppColor.lightgreyColor
                                      ),
                                  child:
                                      const Center(child: Text('Choose Files')),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            // color:AppColor.primaryColor,
                            width: size.width <= 500
                                ? size.width * 0.512
                                : size.width * 0.197,
                            child: TextDesign(
                              text: widget.fileNamesList.isEmpty
                                  ? 'No files chosen'
                                  : widget.fileNamesList.join(','),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.fileBytesList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: widget.fileBytesList.isNotEmpty
                                  ? size.width <= 500
                                      ? size.height * 0.22
                                      : size.height * 0.25
                                  : null,
                              child: GridView.builder(
                                itemCount: widget.fileBytesList.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            hovered = !hovered;
                                            hoveredIndex = index;
                                          });
                                        },
                                        child: Image.memory(
                                          widget.fileBytesList[index],
                                          width: size.height * 0.25,
                                          height: size.width <= 500
                                              ? size.height * 0.15
                                              : size.height * 0.25,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        reverseDuration:
                                            const Duration(milliseconds: 100),
                                        child: hovered &&
                                                hoveredIndex ==
                                                    index
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColor.redColor),
                                                onPressed: () {
                                                  widget.fileBytesList
                                                      .removeAt(
                                                          hoveredIndex!);
                                                  widget.fileNamesList
                                                      .removeAt(
                                                          hoveredIndex!);
                                                  hoveredIndex =
                                                      null;
                                                  setState(() {
                                                    hovered =
                                                        false;
                                                  });
                                                },
                                                child: TextDesign(
                                                  text: 'Remove',
                                                  color: AppColor.whiteColor,
                                                ))
                                            : Container(),
                                      )
                                    ],
                                  );
                                },
                                physics: const AlwaysScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.3,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: TextDesign(
                                text:
                                    '*Note: You can remove unnecessary ${widget.title}  by clicking respective ${widget.title} ',
                                fontsize: 9,
                                color: AppColor.redColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.2,
                          child: ButtonFields(
                            onTap: () {},
                            txtColor: AppColor.whiteColor,
                            text: 'Upload',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))),
        buildNavigationButtons(
          context,
          nextPage: widget.nextPage,
          previousPage: widget.previousPage,
          isIndexLast: widget.isPage ? true : false,
        ),
       ]),
    );
  }
}
