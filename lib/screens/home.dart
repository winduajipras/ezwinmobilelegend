// ignore_for_file: unused_local_variable

import 'package:ezwinmobilelegend/controllers/firestore_controller.dart';
import 'package:ezwinmobilelegend/controllers/storage_controller.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List category = ['News', 'Hero', 'Tournament', 'Item', 'Event'];
    String selectedCategory = 'news';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: MediaQuery.of(context).size.width / 2.5,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.hive)),
                    const Text(
                      "Hero Stats",
                      style: KTextStyle.bottomNavigationBarSelectedTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shield_outlined)),
                    const Text(
                      "Items Stats",
                      style: KTextStyle.bottomNavigationBarSelectedTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.data_saver_on_sharp)),
                    const Text(
                      "Counter Pick",
                      textAlign: TextAlign.center,
                      style: KTextStyle.bottomNavigationBarSelectedTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.grid_view_sharp,
                size: 15,
                color: AppColors.status,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                            child: Text(
                              category[index],
                              style: KTextStyle.categoryNewsTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              selectedCategory = category[index].toLowerCase();
                            }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          GetX<NewsController>(
            init: NewsController(),
            builder: (newsController) {
              return Expanded(
                flex: 6,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsController.news.isNotEmpty
                      ? 1
                      : newsController.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    final _newsModel = newsController.news[index];
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              FutureBuilder(
                                future: loadImage("news/", _newsModel.image),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> image) {
                                  if (image.hasData) {
                                    return Image.network(
                                      image.data.toString(),
                                    ); // image is ready
                                  } else {
                                    return Container(); // placeholder
                                  }
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 88, bottom: 8),
                                alignment: Alignment.center,
                                height: 40,
                                color: AppColors.navy,
                                child: Text(
                                  _newsModel.header,
                                  style: KTextStyle.headerNewsTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: AppColors.lime,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30))),
                                    width: 80,
                                    height: 50,
                                    child: Text(
                                      _newsModel.category,
                                      style: KTextStyle.categoryNewsTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
