// ignore_for_file: depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_dimension.dart';
import 'package:challengebessiha/core/constants/app_image.dart';
import 'package:challengebessiha/core/functions/url_functions.dart';
import 'package:challengebessiha/providers/comics_provider.dart';
import 'package:challengebessiha/views/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class UrlListScreen extends StatefulWidget {
  const UrlListScreen({super.key, required this.url});
  final String url;
  @override
  State<UrlListScreen> createState() => _UrlListScreenState();
}

class _UrlListScreenState extends State<UrlListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ComicsProvider>(context, listen: false)
          .getComics(urlEndpoints: widget.url);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.colorPrimary,
        appBar: appbarWidget(text: "Urls Comics"),
        body: Consumer<ComicsProvider>(builder: (context, comics, child) {
          if (comics.getcomics.isEmpty) {
            return Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: LottieBuilder.asset(ImagesApp.empty),
              ),
            );
          }
          if (comics.isloading) {
            return Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: LottieBuilder.asset(ImagesApp.loading),
              ),
            );
          }
          if (comics.getcomics.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: DimensionApp.padding2,
                  horizontal: DimensionApp.padding2),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      FunctionsUrl.launchURL(url: comics.getcomics[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: ColorApp.colorPrimary.withOpacity(0.8)),
                      child: Text(
                        comics.getcomics[index],
                        style: TextStyle(color: ColorApp.withe),
                      ),
                    ),
                  );
                },
                itemCount: comics.getcomics.length,
              ),
            );
          }
          return const SizedBox();
        }));
  }
}
