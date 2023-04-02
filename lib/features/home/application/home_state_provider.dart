import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/domain/models/episode/episode_model.dart';
import 'package:rick_and_morty/features/home/infrastructure/repositories/home_repository.dart';
import 'package:rick_and_morty/features/home/infrastructure/repositories/local_home_repository.dart';
import 'package:rick_and_morty/features/home/application/home_state.dart';

class HomeDataNotifier extends StateNotifier<HomeState> {
  HomeDataNotifier(
    this.homeRepository,
    this.localHomeRepository,
    this.connectivity,
  ) : super(HomeState()) {
    getCharacters();
  }
  HomeRepository homeRepository;
  LocalHomeRepository localHomeRepository;
  Connectivity connectivity;

  Future<void> getCharacters() async {
    state = state.copyWith(isLoading: true);
    CharacterData data;
    final ConnectivityResult connectivityStatus =
        await connectivity.checkConnectivity();
    if (connectivityStatus == ConnectivityResult.none) {
      List<CharacterModel> models =
          await localHomeRepository.getAllCharacters();
      data = CharacterData(characterModels: models);
    } else {
      data = await homeRepository.fetchCharacters();
      await localHomeRepository
          .updateLocalCharacterDatatable(data.characterModels);
    }

    state = state.copyWith(
      characterData: data,
      isLoading: false,
    );
    return updateConnectionStatus(connectivityStatus);
  }

  Future<void> getEpisodes(List<String> url) async {
    state = state.copyWith(isEpisodeLoading: true);
    List<EpisodeModel> data = await homeRepository.fetchEpisodes(url);
    state = state.copyWith(
      episodeModels: data,
      isEpisodeLoading: false,
    );
  }

  void updateConnectionStatus(ConnectivityResult connectionStatus) {
    state = state.copyWith(
      hasInternet: connectionStatus != ConnectivityResult.none,
    );
  }
}
