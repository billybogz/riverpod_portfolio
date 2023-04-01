import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/data/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/data/models/episode/episode_model.dart';
import 'package:rick_and_morty/features/home/data/models/home_state.dart';
import 'package:rick_and_morty/features/home/data/repository/home_repository.dart';

class HomeDataNotifier extends StateNotifier<HomeState> {
  HomeDataNotifier(this.homeRepository) : super(HomeState()) {
    getCharacters();
  }
  HomeRepository homeRepository;

  Future<void> getCharacters() async {
    state = state.copyWith(isLoading: true);
    CharacterData data = await homeRepository.fetchCharacters();
    state = state.copyWith(
      characterData: data,
      isLoading: false,
    );
  }

  Future<void> getEpisodes(List<String> url) async {
    state = state.copyWith(isEpisodeLoading: true);
    List<EpisodeModel> data = await homeRepository.fetchEpisodes(url);
    state = state.copyWith(
      episodeModels: data,
      isEpisodeLoading: false,
    );
  }
}
