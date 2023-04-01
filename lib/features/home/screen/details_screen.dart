import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/core/utilities/date_time_utils.dart';
import 'package:rick_and_morty/core/utilities/themes.dart';
import 'package:rick_and_morty/features/home/data/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/data/models/episode/episode_model.dart';
import 'package:rick_and_morty/features/home/provider/home_provider.dart';

class DetailsScreen extends ConsumerWidget {
  final CharacterModel characterModel;

  const DetailsScreen({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<EpisodeModel> models = ref.watch(homeDataProvider).episodeModels;
    final bool isEpisodeLoading = ref.watch(homeDataProvider).isEpisodeLoading;
    return Scaffold(
      backgroundColor: MyTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: MyTheme.catalogueButtonColor),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 35,
                child: Center(
                  child: Image.network(
                    characterModel.image,
                    width: 1000.0,
                    height: 1000.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(
                flex: 65,
              )
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyTheme.grey.withOpacity(0.5),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(1.0),
                            ),
                          ),
                          height: 4,
                          width: 48,
                        ),
                      ),
                      MyTheme.mediumVerticalPadding,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '# ${characterModel.id}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Last update:  ${DateTimeUtils.formatStringDate(
                              characterModel.created,
                              dateFormat: DateFormat('MMM. dd, yyyy'),
                            )}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        characterModel.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        characterModel.status,
                        style: TextStyle(fontSize: 16, color: MyTheme.grey),
                      ),
                      MyTheme.largeVerticalPadding,
                      Text(
                        '${characterModel.species} | ${characterModel.gender}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyTheme.smallVerticalPadding,
                      const Text(
                        'Learn the basics of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: TextStyle(fontSize: 16),
                      ),
                      MyTheme.mediumVerticalPadding,
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyTheme.smallVerticalPadding,
                      Text(
                        'Current Location: ${characterModel.location.name}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Origin Location: ${characterModel.origin.name}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      MyTheme.mediumVerticalPadding,
                      const Text(
                        'Episodes',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyTheme.smallVerticalPadding,
                      isEpisodeLoading
                          ? const Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ListView.builder(
                              itemCount: models.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EpisodeChild(models: models[index]);
                              },
                            ),
                      // : EpisodeChild(models: models),
                      MyTheme.mediumVerticalPadding,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EpisodeChild extends StatelessWidget {
  const EpisodeChild({super.key, required this.models});
  final EpisodeModel models;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${models.episode} - ${models.name}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          models.airDate!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        MyTheme.smallVerticalPadding,
      ],
    );
  }
}
