import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/data/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/provider/home_provider.dart';
import 'package:rick_and_morty/features/home/screen/details_screen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoading = ref.watch(homeDataProvider).isLoading;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const _RickAndMortyItems(),
    );
  }
}

class _RickAndMortyItems extends ConsumerWidget {
  const _RickAndMortyItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CharacterModel> models =
        ref.watch(homeDataProvider).characterData!.characterModels;
    return models.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 150,
                left: 8,
                right: 8,
              ),
              child: Text(
                'There are no any characters.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox(
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
                    ref
                        .read(homeDataProvider.notifier)
                        .getEpisodes(models[index].episode);
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            DetailsScreen(characterModel: models[index]),
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
                        SizedBox(
                          width: 100.w,
                          height: 18.h,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: models[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            models[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
