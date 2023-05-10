// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/data/models/marvel_model.dart';
import 'package:challengebessiha/providers/caracter_provider.dart';
import 'package:challengebessiha/providers/favourit_provider.dart';
import 'package:challengebessiha/views/screens/urls_list.dart';
import 'package:challengebessiha/views/widgets/text_utils.dart';
import 'package:provider/provider.dart';

class CharacterScreenDetails extends StatelessWidget {
  const CharacterScreenDetails({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.colorPrimary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${characterModel.thumbnail.path}.${characterModel.thumbnail.extension}"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextUtils(
                        size: 26,
                        color: ColorApp.withe,
                        weight: FontWeight.w700,
                        text: characterModel.name),
                  ),
                  Consumer<FavouritProvider>(
                      builder: (context, favourit, child) {
                    var exist = favourit.characterExiste(
                        characterModel: characterModel);

                    return IconButton(
                      icon: Icon(
                        exist ? Icons.favorite : Icons.favorite_outline,
                        color: Colors.red,
                        size: 28,
                      ),
                      onPressed: () {
                        if (!favourit.characterExiste(
                            characterModel: characterModel)) {
                          favourit.addCharacter(characterModel: characterModel);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Character ajouté déja aux favoris")));
                        }
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextUtils(
                    size: 22,
                    color: ColorApp.withe,
                    weight: FontWeight.w400,
                    text: "Liste des Comics :"),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<CharacterProvider>(builder: (context, character, child) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UrlListScreen(
                                        url: characterModel
                                            .comics.items[index].resourceURI)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              characterModel.comics.items[index].name,
                              style: TextStyle(
                                  color: ColorApp.withe,
                                  height: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ));
                    },
                    itemCount: characterModel.comics.items.length,
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
