import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/presentation/screens/details_screen.dart';
import 'package:rick_and_morty/features/home/application/home_provider.dart';
import 'package:sizer/sizer.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    required this.models,
    required this.hasInternet,
    required this.ref,
  });

  final List<CharacterModel> models;
  final bool hasInternet;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 90.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (hasInternet) {
                ref
                    .read(homeDataProvider.notifier)
                    .getEpisodes(models[index].episode!);
              }
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => DetailsScreen(
                    characterModel: models[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 20.w,
              height: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _ImageView(models[index]),
                  _NameView(models[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  const _ImageView(this.model);
  final CharacterModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 18.h,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: model.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _NameView extends StatelessWidget {
  const _NameView(this.model);
  final CharacterModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      child: Text(
        model.name,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}