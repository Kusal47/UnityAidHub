import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unity_admin/resources/texfields_pages.dart';
import 'package:unity_admin/utils/text_design.dart';
import '../../core/theme/app_color.dart';
import '../../data/lists.dart';
import '../../resources/card.dart';
import '../../resources/custom_dropdown.dart';
import '../../widgets/title_text.dart';
import '../pages/AdminScaffold/admin_scaffold_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var selectedValue;
    TextEditingController searchC = TextEditingController();
    return MyScaffold(
      route: '/dashboard',
      body: SizedBox(
        height: size.height * 0.899,
        child: Column(
          children: [
            // Container(
            //     alignment: Alignment.topLeft,
            //     padding: const EdgeInsets.all(10),
            //     child: GridView.builder(
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemCount: 6,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: size.width < 600
            //             ? 2
            //             : size.width < 1000
            //                 ? 3
            //                 : 6,
            //         childAspectRatio: 6 / 3,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10,
            //       ),
            //       itemBuilder: (context, index) => DashBoardCard(
            //         icon: data[index]['icon'],
            //         title: data[index]['title'],
            //         count: data[index]['count'],
            //         onClick: data[index]['onClick'],
            //       ),
            //     )),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'Show',
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 68.7,
                              height: 40,
                              child: CustomDropdown(
                                number: true,
                                onChanged: (value) {
                                  // Update the selected value when an item is chosen
                                  setState(() {
                                    selectedValue = value!;

                                  });
                                },
                                data: items,
                                fontSize: 12,
                                values: selectedValue,
                              ),
                            ),
                          ],
                        ),
                      
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextDesign(
                                text: 'entries',
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  size.width < 900
                      ? SizedBox()
                      : const Expanded(child: SizedBox()),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomFields(
                            controller: searchC,
                            hinttext: 'Search',
                            isSmall: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add Category',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white54,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleText(text: "ID", flex: 1),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Category",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Customer",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const TitleText(
                            text: "Date",
                          ),
                          Icon(
                            Icons.unfold_more,
                            size: 25,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                    ),
                    const TitleText(
                      text: "Amount",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Payment Mode",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Status",
                      flex: 2,
                    ),
                    const TitleText(
                      text: "Actions",
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 1.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${index + 1}.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'Shyam Bahadur',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Health',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '\$1000',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Fonepay',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.buttonColor1,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Processing',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: AppColor.buttontxtColor1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(Icons.edit_square),
                                    onPressed: () {},
                                  ),
                                ),

                                // const Icon(Icons.remove_red_eye),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColor.redColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
