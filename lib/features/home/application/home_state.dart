import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/domain/models/episode/episode_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(<CharacterData>[]) List<CharacterData> characterDatas,
    @Default(true) bool isLoading,
    @Default(<EpisodeModel>[]) List<EpisodeModel> episodeModels,
    @Default(true) bool isEpisodeLoading,
    @Default(true) bool hasInternet,
    @Default(false) bool isLoadMoreLoading,
  }) = _HomeState;
}
