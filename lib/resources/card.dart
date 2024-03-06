import 'package:flutter/material.dart';
import 'package:unity_admin/utils/text_design.dart';

import '../core/theme/app_color.dart';

class DashBoardCard extends StatefulWidget {
  final int? count;
  final String? title;
  final Color? iconcolor;
  final IconData? icon;
  final VoidCallback? onClick;

  const DashBoardCard({super.key, this.count, this.title, this.icon, this.onClick, this.iconcolor});

  @override
  State<DashBoardCard> createState() => _DashBoardCardState();
}

class _DashBoardCardState extends State<DashBoardCard> {
  double offsetY = 0.0;
  double scale = 1.0;

  late Color color;
  late Color txtcolor;

  @override
  void initState() {
    super.initState();
    color = AppColor.white;
    txtcolor = AppColor.darkColor;
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onClick,
        child: MouseRegion(
          onEnter: (e) {
            setState(() {
              offsetY = 3.2;
              scale = 1.07;
              color = AppColor.white;
              txtcolor = AppColor.darkColor;
            });
          },
          onExit: (e) {
            setState(() {
              offsetY = 0.0;
              scale = 1.0;
              color = AppColor.white;
              txtcolor = AppColor.darkColor;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Transform.scale(
              scale: scale,
              child: Transform.translate(
                offset: Offset(0, offsetY),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.primaryColor,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextDesign(
                                  text: widget.count.toString(),
                                  fontsize: 44,
                                  color: txtcolor,
                                  fontweight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                Expanded(
                                  child: TextDesign(
                                    text: widget.title.toString(),
                                    fontsize: 24,
                                    color: txtcolor,
                                    fontweight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                // decoration: BoxDecoration(
                                //     color: Colors.transparent,
                                //     borderRadius: BorderRadius.circular(100)),

                                child: Icon(
                                  widget.icon!,
                                  size: 50,
                                  color:widget.iconcolor,

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
