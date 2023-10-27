// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/modules/tabF/controllers/tabf_controller.dart';
import 'package:netflix/routes/app_pages.dart';

class TabFView extends GetView<TabFController> {
  const TabFView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          'https://www.tvguide.com/a/img/catalog/provider/1/1/1-7484332417.jpg')))),
          Container(
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          splashColor: Colors.white,
                          splashRadius: 1,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      Text(
                        'My List',
                        style: TextStyle(
                            color: Color.fromARGB(176, 196, 196, 196)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          elevation: MaterialStatePropertyAll(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                      child: Row(
                        children: [Icon(Icons.play_arrow), Text('Play')],
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                      Text(
                        'Info',
                        style: TextStyle(
                            color: Color.fromARGB(176, 196, 196, 196)),
                      )
                    ],
                  ),
                ],
              )),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '${controller.text}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          niceHome(),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Popular on Netflix',
              style: TextStyle(color: Colors.white),
            ),
          ),
          niceHome(),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Trending Now',
              style: TextStyle(color: Colors.white),
            ),
          ),
          niceHome(),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Watch it Again',
              style: TextStyle(color: Colors.white),
            ),
          ),
          niceHome()
        ],
      ),
    );
  }
}

Widget niceHome() {
  return Container(
      color: Colors.black,
      height: 100,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('movies').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final allPosts = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.only(top: 15, left: 0),
            child: Container(
              height: 200,
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 20,
                ),
                itemCount: allPosts.length,
                itemBuilder: (context, index) {
                  final post = allPosts[index];
                  return CircleAvatar(
                    backgroundImage: NetworkImage(post['image']),
                    radius: 50,
                    child: MaterialButton(onPressed: () {
                      Get.toNamed(Routes.DISPLAY, arguments: post['video']);
                    }),
                  );
                },
              ),
            ),
          );
        },
      ));
}
