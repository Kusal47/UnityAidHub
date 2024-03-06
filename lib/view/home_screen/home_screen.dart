// home_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_color.dart';
import '../../resources/card.dart';
import '../../view_model/dashboard_view_model.dart';
import '../pages/AdminScaffold/admin_scaffold_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DashboardViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      route: '/dashboard',
      body: Consumer<DashboardViewModel>(builder: (context, dashb, index) {
        List<Map<String, dynamic>> data = [
          {
            'title': "Total Users",
            'count': dashb.totalUsers,
            'icon': {'icon': CupertinoIcons.group_solid, 'color': AppColor.darkColor},
            'onClick': () {},
          },
          {
            'title': "Active Users",
            'count': dashb.totalActiveUsers,
            'icon': {'icon': Bootstrap.person_fill_check, 'color': AppColor.primaryColor},
            'onClick': () {},
          },
          {
            'title': "Inactive Users",
            'count': dashb.totalInActiveUsers,
            'icon': {'icon': Bootstrap.person_fill_dash, 'color': AppColor.redColor},
            'onClick': () {},
          },
          {
            'title': "Total Posts",
            'count': dashb.totalPosts,
            'icon': {'icon': Bootstrap.file_earmark_post, 'color': AppColor.darkColor},
            'onClick': () {},
          },
          {
            'title': "Verified Posts",
            'count': dashb.totalVerifiedPosts,
            'icon': {'icon': OctIcons.verified, 'color': AppColor.primaryColor},
            'onClick': () {},
          },
          {
            'title': "Unverified Posts",
            'count': dashb.totalUnverifiedPosts,
            'icon': {'icon': OctIcons.unverified, 'color': AppColor.redColor},
            'onClick': () {},
          },
          {
            'title': "Total Donation",
            'count': dashb.totalDonation,
            'icon': {'icon': OctIcons.code_of_conduct, 'color': AppColor.redColor},
            'onClick': () {},
          },
          {
            'title': "Funds Collected",
            'count': dashb.totalDonationCount,
            'icon': {'icon': Bootstrap.bar_chart_steps, 'color': AppColor.darkColor},
            'onClick': () {},
          },
          {
            'title': "Campaign Duration",
            'count': dashb.totalDonationDay,
            'icon': {'icon': Icons.calendar_today_rounded, 'color': AppColor.primaryColor},
            'onClick': () {},
          },
        ];

        // print('Total Value of user ${dashb.totalUsers}');
        // print('Total Value of Active ${dashb.totalActiveUsers}');
        // print('Total Value of inactive ${dashb.totalInActiveUsers}');
        // print('Total Value of posts ${dashb.totalPosts}');
        // print('Total Value of verified${dashb.totalVerifiedPosts}');
        // print('Total Value of unverified${dashb.totalUnverifiedPosts}');

        return Column(
          children: [
            // const Text(
            //   'Dashboard',
            //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.899,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return DashBoardCard(
                              icon: data[index]['icon']['icon'],
                              title: data[index]['title'],
                              count: data[index]['count'],
                              onClick: data[index]['onClick'],
                              iconcolor: data[index]['icon']['color'],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
