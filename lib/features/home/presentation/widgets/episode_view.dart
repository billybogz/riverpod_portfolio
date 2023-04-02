import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utilities/themes.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/domain/models/episode/episode_model.dart';

class EpisodeView extends StatelessWidget {
  const EpisodeView({
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
                  return _EpisodeChild(models: episodeModel[index]);
                },
              ),
      ],
    );
  }
}

class _EpisodeChild extends StatelessWidget {
  const _EpisodeChild({required this.models});
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
