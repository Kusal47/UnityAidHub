import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';
import '../utils/text_design.dart';

class CategoryImages extends StatefulWidget {
  const CategoryImages({
    super.key,
    required this.onTap,
    required this.fileBytesList,
    required this.fileNamesList,
  });

  final Function() onTap;
  final List<Uint8List> fileBytesList;
  final List<String> fileNamesList;
  @override
  State<CategoryImages> createState() => _CategoryImagesState();
}

class _CategoryImagesState extends State<CategoryImages> {
  bool hovered = false;
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
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
                                color: AppColor.lightgreyColor),
                            child:
                                const Center(child: Text('Choose Files')),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextDesign(
                      text: widget.fileNamesList.isEmpty
                          ? 'No files chosen'
                          : widget.fileNamesList.join(','),
                      fontStyle: FontStyle.italic,
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
                                ? size.height * 0.12
                                : size.height * 0.22
                            : null,
                        child:Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hovered = !hovered;
                                      hoveredIndex = 0;
                                    });
                                  },
                                  child: Image.memory(
                                    widget.fileBytesList[0],
                                    width: size.height * 0.25,
                                    height: size.width <= 500
                                        ? size.height * 0.12
                                        : size.height * 0.22,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                AnimatedSwitcher(
                                  duration:
                                      const Duration(milliseconds: 500),
                                  reverseDuration:
                                      const Duration(milliseconds: 100),
                                  child: hovered && hoveredIndex == 0
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.redColor),
                                          onPressed: () {
                                            widget.fileBytesList
                                                .removeAt(hoveredIndex!);
                                            widget.fileNamesList
                                                .removeAt(hoveredIndex!);
                                            hoveredIndex = null;
                                            setState(() {
                                              hovered = false;
                                            });
                                          },
                                          child: TextDesign(
                                            text: 'Remove',
                                            color: AppColor.whiteColor,
                                          ))
                                      : Container(),
                                )
                              ],
                            )
                         
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: TextDesign(
                          text: '*Note: You can remove image by clicking. ',
                          fontsize: 9,
                          color: AppColor.redColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
    
  }
}
