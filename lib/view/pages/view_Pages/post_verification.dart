import 'package:flutter/material.dart';
import 'package:unity_admin/Models/post_model.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../data/lists.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';
import 'dart:math' as math;

class PostVerification extends StatefulWidget {
  const PostVerification({Key? key}) : super(key: key);

  @override
  _PostVerificationState createState() => _PostVerificationState();
}

class _PostVerificationState extends State<PostVerification> {
  List<Widget> postLists = [];
  List<Post> _post = [];
  int selectedPostIndex = -1;

  @override
  void initState() {
    super.initState();
    addPost();
  }

  void addPost() {
    for (var post in posts) {
      postLists.add(buildTile(post));
      _post.add((post));
    }
  }

  Widget buildTile(Post post) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPostIndex = post.postId - 1;
        });
      },
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  post.image,
                  height: 80,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDesign(
                        text: '${post.postId}.${post.title}',
                        fontsize: 14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        children: [
                          TextDesign(
                            text: post.country,
                            fontsize: 10,
                            overflow: TextOverflow.ellipsis,
                            fontweight: FontWeight.w100,
                          ),
                          TextDesign(
                            text: post.date,
                            fontweight: FontWeight.w100,
                            fontsize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                subtitle: TextDesign(
                  text: post.desc,
                  fontsize: 12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_right_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesc() {
    if (selectedPostIndex >= 0 && selectedPostIndex < postLists.length) {
      Post selectedPost = _post[selectedPostIndex];
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.borderColor,
                border: Border.all(
                  width: 2,
                )),
            child: Card(
              child: Stack(
                children: [
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                selectedPost.image,
                                height: 200,
                                width: 300,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  TextDesign(
                                    text: selectedPost.title,
                                    fontsize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  Row(
                                    children: [
                                      TextDesign(
                                        text: selectedPost.country,
                                        fontsize: 10,
                                        overflow: TextOverflow.ellipsis,
                                        fontweight: FontWeight.w100,
                                      ),
                                      TextDesign(
                                        text: selectedPost.date,
                                        fontweight: FontWeight.w100,
                                        fontsize: 10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TextDesign(
                              text: selectedPost.desc,
                              fontsize: 12,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: AppColor.borderColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Edit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColor.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: AppColor.redColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Delete',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColor.whiteColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Approve',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColor.whiteColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPostIndex = -1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.borderColor,
                          ),
                          child: const Icon(Icons.clear_sharp)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.borderColor,
              border: Border.all(
                width: 0.001,
              )),
          child: Card(
            child: SizedBox(
              width: 500,
              height: 500,
              child: Center(
                child: Transform.rotate(
                  angle: -math.pi / 4,
                  child: TextDesign(
                    text: "No Post Selected to Preview",
                    fontStyle: FontStyle.italic,
                    fontsize: 30,
                    color: AppColor.borderColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: RouteName.postverify,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 600,
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: postLists.length,
                    itemBuilder: (context, index) {
                      return postLists[index];
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: buildDesc(),
          ),
        ],
      ),
    );
  }
}
