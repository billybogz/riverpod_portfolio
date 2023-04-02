import 'package:cached_network_image/cached_network_image.dart';
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

  final String _sampleDescription =
      'Learn the basics of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<EpisodeModel> models = ref.watch(homeDataProvider).episodeModels;
    final bool isEpisodeLoading = ref.watch(homeDataProvider).isEpisodeLoading;
    final bool hasInternet = ref.watch(homeDataProvider).hasInternet;
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
                  child: CachedNetworkImage(
                    imageUrl: characterModel.image,
                    width: 1000.0,
                    height: 1000.0,
                    fit: BoxFit.cover,
                    placeholder: (BuildContext context, String url) =>
                        CircularProgressIndicator(),
                    errorWidget: (
                      BuildContext context,
                      String url,
                      dynamic error,
                    ) {
                      return Icon(
                        Icons.broken_image,
                        size: 132.0,
                        color: Colors.blueGrey,
                      );
                    },
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
                      _TitleView(
                        characterModel: characterModel,
                        hasInternet: hasInternet,
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
                      Text(
                        _sampleDescription,
                        style: TextStyle(fontSize: 16),
                      ),
                      MyTheme.mediumVerticalPadding,
                      _LocationView(
                        characterModel: characterModel,
                      ),
                      MyTheme.mediumVerticalPadding,
                      _EpisodeView(
                        isEpisodeLoading: isEpisodeLoading,
                        characterModel: characterModel,
                        hasInternet: hasInternet,
                        episodeModel: models,
                      ),
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

class _TitleView extends StatelessWidget {
  const _TitleView({
    required this.characterModel,
    required this.hasInternet,
  });

  final CharacterModel characterModel;
  final bool hasInternet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
              hasInternet
                  ? 'Last update:  ${DateTimeUtils.formatStringDate(
                      characterModel.created!,
                      dateFormat: DateFormat('MMM. dd, yyyy'),
                    )}'
                  : characterModel.created!,
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
          characterModel.status!,
          style: TextStyle(fontSize: 16, color: MyTheme.grey),
        ),
      ],
    );
  }
}

class _LocationView extends StatelessWidget {
  const _LocationView({required this.characterModel});
  final CharacterModel characterModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Location',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        MyTheme.smallVerticalPadding,
        Text(
          'Current Location: ${characterModel.location != null ? characterModel.location!.name : '-'}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Origin Location: ${characterModel.location != null ? characterModel.origin!.name : '-'}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class _EpisodeView extends StatelessWidget {
  const _EpisodeView({
    required this.isEpisodeLoading,
    required this.characterModel,
    required this.hasInternet,
    required this.episodeModel,
  });

  final bool isEpisodeLoading;
  final CharacterModel characterModel;
  final bool hasInternet;
  final List<EpisodeModel> episodeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Episodes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        MyTheme.smallVerticalPadding,
        isEpisodeLoading
            ? Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: hasInternet ? CircularProgressIndicator() : null,
                ),
              )
            : ListView.builder(
                itemCount: episodeModel.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return EpisodeChild(models: episodeModel[index]);
                },
              ),
      ],
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
