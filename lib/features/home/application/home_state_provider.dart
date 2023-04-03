// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
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
  ) : super(HomeState()) {
    getCharacters();
  }
  HomeRepository homeRepository;
  LocalHomeRepository localHomeRepository;

  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity();

  Future<void> getCharacters() async {
    state = state.copyWith(isLoading: true);
    CharacterData data;
    bool connectivityStatus =
        await _flutterNetworkConnectivity.isInternetConnectionAvailable();
    if (!connectivityStatus) {
      List<CharacterModel> models =
          await localHomeRepository.getAllCharacters();
      data = CharacterData(characterModels: models);
    } else {
      data = await homeRepository.fetchCharacters();
      await localHomeRepository.updateLocalCharacterDatatable(
        data.characterModels,
        isInitialList: true,
      );
    }
    state = state.copyWith(
      characterDatas: <CharacterData>[data],
      isLoading: false,
    );
    return updateConnectionStatus(connectivityStatus);
  }

  Future<void> getMoreCharacters() async {
    bool connectivityStatus =
        await _flutterNetworkConnectivity.isInternetConnectionAvailable();
    updateConnectionStatus(connectivityStatus);
    if (!connectivityStatus) {
      return;
    }
    if (state.characterDatas.last.info!.next == null) {
      state = state.copyWith(isLoadMoreLoading: false);
    }
    state = state.copyWith(isLoadMoreLoading: true);
    List<CharacterData> datas = state.characterDatas;
    CharacterData data;
    data = await homeRepository.fetchCharacters(
      nextUrl: state.characterDatas.last.info!.next,
    );
    List<CharacterData> newDatas = <CharacterData>[...datas, data];
    final List<CharacterModel> models = newDatas
        .map((CharacterData data) => data.characterModels)
        .toList()
        .expand((List<CharacterModel> element) => element)
        .toList();
    await localHomeRepository.updateLocalCharacterDatatable(models);
    state = state.copyWith(
      characterDatas: newDatas,
      isLoadMoreLoading: false,
    );
    // }
    return;
  }

  Future<void> getEpisodes(List<String> url) async {
    state = state.copyWith(isEpisodeLoading: true);
    List<EpisodeModel> data = await homeRepository.fetchEpisodes(url);
    state = state.copyWith(
      episodeModels: data,
      isEpisodeLoading: false,
    );
  }

  void updateConnectionStatus(bool hasInternet) {
    state = state.copyWith(
      hasInternet: hasInternet,
    );
  }
}
