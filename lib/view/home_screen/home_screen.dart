import 'package:flutter/material.dart';
import '../../utils/text_design.dart';
import '../pages/AdminScaffold/admin_scaffold_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    return const MyScaffold(
      route: '/dashboard',
      body: TextDesign(text:
          'Dashboard',
            fontweight: FontWeight.w700,
            fontsize: 24,
          
        )
      // SizedBox(
      //   height: size.height * 0.899,
      //   child: Column(
      //     children: [
      //       // Container(
      //       //     alignment: Alignment.topLeft,
      //       //     padding: const EdgeInsets.all(10),
      //       //     child: GridView.builder(
      //       //       shrinkWrap: true,
      //       //       physics: const ClampingScrollPhysics(),
      //       //       itemCount: 6,
      //       //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       //         crossAxisCount: size.width < 600
      //       //             ? 2
      //       //             : size.width < 1000
      //       //                 ? 3
      //       //                 : 6,
      //       //         childAspectRatio: 6 / 3,
      //       //         crossAxisSpacing: 10,
      //       //         mainAxisSpacing: 10,
      //       //       ),
      //       //       itemBuilder: (context, index) => DashBoardCard(
      //       //         icon: data[index]['icon'],
      //       //         title: data[index]['title'],
      //       //         count: data[index]['count'],
      //       //         onClick: data[index]['onClick'],
      //       //       ),
      //       //     )),

      //     ],
      //   ),
      // ),
   
    );
  }
}
