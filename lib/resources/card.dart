import 'package:flutter/material.dart';
import 'package:unity_admin/utils/text_design.dart';

import '../core/theme/app_color.dart';

class DashBoardCard extends StatefulWidget {
  final int? count;
  final String? title;
  final IconData? icon;
  final VoidCallback? onClick;

  const DashBoardCard(
      {Key? key, this.count, this.title, this.icon, this.onClick})
      : super(key: key);

  @override
  State<DashBoardCard> createState() => _DashBoardCardState();
}

class _DashBoardCardState extends State<DashBoardCard> {
  double offsetY = 0.0;
  double scale = 1.0;

  late Color color;

  @override
  void initState() {
    super.initState();
    color = AppColor.secondaryColor;
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onClick,
        child: MouseRegion(
          onEnter: (e) {
            setState(() {
              offsetY = 3;
              scale = 1.02;
              color = AppColor.primaryColor;
            });
          },
          onExit: (e) {
            setState(() {
              offsetY = 0.0;
              scale = 1.0;
              color = AppColor.secondaryColor;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            child: Transform.scale(
              scale: scale,
              child: Transform.translate(
                offset: Offset(0, offsetY),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.darkColor.withOpacity(.3),
                    ),
                    color: color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextDesign(
                                  text: widget.count.toString(),
                                  fontsize: 24,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                                Expanded(
                                  child: Text(widget.title.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'PTserif')),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                // decoration: BoxDecoration(
                                //     color: Colors.transparent,
                                //     borderRadius: BorderRadius.circular(100)),

                                child: Icon(
                                  widget.icon!,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
