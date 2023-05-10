// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, depend_on_referenced_packages

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_image.dart';
import 'package:challengebessiha/core/constants/app_route.dart';
import 'package:challengebessiha/providers/caracter_provider.dart';
import 'package:challengebessiha/providers/favourit_provider.dart';
import 'package:challengebessiha/views/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class HomeCaracterScreen extends StatefulWidget {
  const HomeCaracterScreen({super.key});

  @override
  State<HomeCaracterScreen> createState() => _HomeCaracterScreenState();
}

class _HomeCaracterScreenState extends State<HomeCaracterScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_scrolListner);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CharacterProvider>(context, listen: false).getCharacters();
      Provider.of<FavouritProvider>(context, listen: false)
          .initalizSharedPreferences();
    });

    super.initState();
  }

  void _scrolListner() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      var character = Provider.of<CharacterProvider>(context, listen: false);
      character.changelimit();
      await character.getCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.colorPrimary,
        body:
            Consumer<CharacterProvider>(builder: (context, characters, child) {
          if (characters.isloading) {
            return Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: LottieBuilder.asset(ImagesApp.loading),
              ),
            );
          }
          if (characters.characters.isEmpty) {
            return Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: LottieBuilder.asset(ImagesApp.empty),
              ),
            );
          }
          if (characters.characters.isNotEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 50,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.asset(
                          ImagesApp.background1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                ImagesApp.logo,
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'MARVEL CHARACTERS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Get hooked on a hearty helping of heroes and villains\nfrom the humble House of Ideas!',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Approute.favourit);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade700,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              child: Text("Favoris"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: ListView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return CardCharacter(
                          characterModel: characters.characters[index],
                        );
                      },
                      itemCount: characters.characters.length,
                      shrinkWrap: true,
                    ),
                  ),
                )
              ],
            );
          }
          return SizedBox();
        }));
  }
}
