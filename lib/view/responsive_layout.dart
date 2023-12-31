import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  const ResponsiveLayout({Key? key, required this.tiny, required this.tablet, required this.largeTablet, required this.computer}) : super(key: key);


  static final int tinyHeightLimit=100;
  static final int tinyLimit = 270;
  static final int phoneLimit = 550;
  static final int tabletLimit =800;
  static final int largeTabletLimit = 1100;

  static bool isTabletLimit(BuildContext context)=>
    MediaQuery.of(context).size.width<tabletLimit && 
    MediaQuery.of(context).size.width>=phoneLimit; 

  static bool isLargeTabletLimit(BuildContext context)=>
    MediaQuery.of(context).size.width<largeTabletLimit && 
    MediaQuery.of(context).size.width>=tabletLimit;

  static bool isLimit(BuildContext context)=>
    MediaQuery.of(context).size.width>=largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
       if(constraints.maxWidth < tinyLimit || constraints.maxHeight<tinyHeightLimit){
        return tiny;

       }
       if(constraints.maxWidth <tabletLimit){
        return tablet;
       }

       if(constraints.maxWidth <largeTabletLimit){
        return largeTablet;
       }else{
        return computer;
       }
      });
  }
}