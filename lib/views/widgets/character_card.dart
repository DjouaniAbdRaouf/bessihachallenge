// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers

import 'package:challengebessiha/core/constants/app_color.dart';
import 'package:challengebessiha/core/constants/app_dimension.dart';
import 'package:challengebessiha/core/functions/url_functions.dart';
import 'package:challengebessiha/data/models/marvel_model.dart';
import 'package:challengebessiha/views/screens/character_details.dart';
import 'package:flutter/material.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CharacterScreenDetails(characterModel: characterModel))),
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorApp.colorPrimary.withOpacity(0.8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${characterModel.thumbnail.path}.${characterModel.thumbnail.extension}"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: DimensionApp.padding1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Text(
                        characterModel.id.toString(),
                        style: TextStyle(
                            color: ColorApp.withe,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              var results = characterModel.urls.indexWhere(
                                  (element) => element.type == "wiki");
                              results == -1
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Link wiki introuvable")))
                                  : FunctionsUrl.launchURL(
                                      url: characterModel.urls[results].url);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorApp.colorPrimary.withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            child: Text("load wiki link"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: DimensionApp.padding1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        characterModel.name,
                        style: TextStyle(
                            color: ColorApp.withe, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        characterModel.description,
                        style: TextStyle(
                            color: ColorApp.withe, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: DimensionApp.padding1,
                )
              ],
            )),
      ),
    );
  }
}
