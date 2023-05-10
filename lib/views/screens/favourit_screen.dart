// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_image.dart';
import 'package:challengebessiha/providers/favourit_provider.dart';
import 'package:challengebessiha/views/widgets/AppBarWidget.dart';
import 'package:challengebessiha/views/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class FavouritScreen extends StatefulWidget {
  const FavouritScreen({super.key});

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FavouritProvider>(context, listen: false).getfavourite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorPrimary,
      appBar: appbarWidget(text: "Mes Favoris"),
      body: Consumer<FavouritProvider>(
        builder: (context, value, child) {
          if (value.getFavourit.isEmpty) {
            return Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: LottieBuilder.asset(ImagesApp.empty),
              ),
            );
          }
          if (value.getFavourit.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CardCharacter(characterModel: value.myfavourites[index]);
              },
              itemCount: value.myfavourites.length,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
