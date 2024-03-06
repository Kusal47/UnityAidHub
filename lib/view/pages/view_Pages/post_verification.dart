// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/Models/post_model.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/utils/dialog_box.dart';
import 'package:unity_admin/utils/toast_utils.dart';
import 'package:unity_admin/view_model/post_verify_view_model.dart';
import '../../../core/theme/app_color.dart';
import '../../../utils/document_details.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class PostVerification extends StatefulWidget {
  const PostVerification({super.key});

  @override
  _PostVerificationState createState() => _PostVerificationState();
}

class _PostVerificationState extends State<PostVerification> {
  List<Post> postLists = [];
  final List<Post> _post = [];
  int selectedPostIndex = 0;
  late Future<List<Post>> _futurePosts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _futurePosts = Provider.of<PostVerificationViewModel>(context).fetchPostsFromApi(
        context); 
    _futurePosts.then((posts) {
      addPost(posts);
    });
  }

  bool showLoad = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showLoad = false;
      });
    });
  }

  void addPost(List<Post> fetchedPosts) {
    for (var post in fetchedPosts) {
      postLists.add(post);
      _post.add((post));
    }
  }
  Widget buildTile(
    Post post,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPostIndex = index;
        });
      },
      child: Card(
        shape: index == selectedPostIndex
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColor.primaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CarouselSlider.builder(
                itemCount: post.image.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final imageUrl = post.image[index];
                  return imageUrl.startsWith('http') && imageUrl.startsWith('https')
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        )
                      : Image.memory(
                          base64.decode(imageUrl.split(',').last),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        );
                },
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListTile(
                onTap: () {
                  setState(() {
                    selectedPostIndex = index;
                  });
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDesign(
                        text: post.title,
                        fontsize: 14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextDesign(
                                text: '${post.startDate}, ',
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextDesign(
                                text: post.country,
                                fontweight: FontWeight.w600,
                                fontsize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          TextDesign(
                            text: post.goalAmount,
                            fontweight: FontWeight.w600,
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                subtitle: TextDesign(
                  text: post.description,
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

  Widget buildDesc(Size size, PostVerificationViewModel viewModel) {
    if (selectedPostIndex >= 0 && selectedPostIndex < postLists.length) {
      Post selectedPost = _post[selectedPostIndex];
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Stack(
            children: [
              SizedBox(
                // width: 500,
                height: size.height / 1.15,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: CarouselSlider.builder(
                              itemCount: selectedPost.image.length,
                              itemBuilder: (BuildContext context, int index, int realIndex) {
                                final imageUrl = selectedPost.image[index];
                                return imageUrl
                                        .startsWith('http') 
                                    ? Image.network(
                                        imageUrl,
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high,
                                      )
                                    : Image.memory(
                                        base64.decode(imageUrl
                                            .split(',')
                                            .last), 
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high,
                                      );
                              },
                              options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              TextDesign(
                                text: selectedPost.title,
                                fontsize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontweight: FontWeight.bold,
                                maxLines: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextDesign(
                                          text: '${selectedPost.startDate}, ',
                                          fontweight: FontWeight.w600,
                                          fontsize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        TextDesign(
                                          text: selectedPost.country,
                                          fontweight: FontWeight.w600,
                                          fontsize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    TextDesign(
                                      text: selectedPost.goalAmount,
                                      fontweight: FontWeight.w900,
                                      fontsize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextDesign(
                          text: selectedPost.description,
                          fontsize: 12,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      showDialogBox(context, 'Reject this Post',
                                          'Are you sure to Reject this Post', () async {
                                        await viewModel.rejectPost(
                                            selectedPost.id.toString(), context);
                                        await viewModel.fetchPostsFromApi(context);
                                        Navigator.pushNamed(context, RouteName.postverify);
                                      }, () => {Navigator.pop(context)});
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                  },
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: AppColor.redColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Reject',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: AppColor.whiteColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      showDialogBox(context, 'Approve this Post',
                                          'Are you sure to Approve this Post', () async {
                                        await viewModel.approvePost(
                                            context, selectedPost.id.toString());
                                        await viewModel.fetchPostsFromApi(context);
                                        Navigator.pushNamed(context, RouteName.postverify);
                                      }, () => {Navigator.pop(context)});
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                  },
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Approve',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: AppColor.whiteColor),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (selectedPost.documents.isNotEmpty) {
                          showDocumentDetails(context, selectedPost, selectedPostIndex);
                        } else {
                          ToastUtils().showCherryToast(context, 'No Document Uploaded', true);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2, color: AppColor.secondaryColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextDesign(
                            text: 'Documents',
                            fontsize: 12,
                            textAlign: TextAlign.center,
                            color: AppColor.darkColor,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<PostVerificationViewModel>(context);
    print(size);
    return MyScaffold(
      route: RouteName.postverify,
      body: showLoad
          ? Align(
              alignment: Alignment.centerRight,
              child: SpinKitWaveSpinner(
                color: AppColor.primaryColor,
                size: 40.0,
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder<List<Post>>(
                      future: _futurePosts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: SpinKitPulse(
                              color: AppColor.primaryColor,
                              size: 40.0,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: TextDesign(
                              text: 'Data not Found',
                              fontsize: 24,
                              fontweight: FontWeight.bold,
                            ),
                          );
                        } else {
                          List<Post> posts = snapshot.data!;

                          return SizedBox(
                            width: size.width * 0.37,
                            height: size.height / 1.13,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                itemCount: posts.length,
                                itemBuilder: (context, index) {
                                  return buildTile(
                                    posts[index],
                                    index,
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      }),
                ),
                Expanded(
                  child: buildDesc(size, viewModel),
                ),
              ],
            ),
    );
  }
}
