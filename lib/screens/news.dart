import 'package:ezwinmobilelegend/controllers/firestore_controller.dart';
import 'package:ezwinmobilelegend/controllers/storage_controller.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetX<NewsController>(
          init: NewsController(),
          builder: (newsController) {
            return Expanded(
              child: ListView.builder(
                itemCount: newsController.news.length,
                itemBuilder: (BuildContext context, int index) {
                  final _newsModel = newsController.news[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
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
                        const SizedBox(
                          height: 20,
                        ),
                        ReadMoreText(
                          _newsModel.content,
                          trimLines: 2,
                          colorClickableText: AppColors.status,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show More',
                          trimExpandedText: 'Show Less',
                          moreStyle: KTextStyle.moreNewsTextStyle,
                          lessStyle: KTextStyle.moreNewsTextStyle,
                          textAlign: TextAlign.justify,
                          style: KTextStyle.contentNewsTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
