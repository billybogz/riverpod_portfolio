import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/network/dio_exceptions.dart';
import 'package:rick_and_morty/features/home/data/api/home_api.dart';
import 'package:rick_and_morty/features/home/data/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/data/models/episode/episode_model.dart';

class HomeRepository {
  final HomeApi _homeApi;

  HomeRepository(this._homeApi);

  Future<CharacterData> fetchCharacters() async {
    try {
      final CharacterData data = await _homeApi.fetchCharactersApiRequest();
      return data;
    } on DioError catch (e) {
      final DioExceptions errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<EpisodeModel>> fetchEpisodes(List<String> urlEpisodes) async {
    try {
      final List<EpisodeModel> data =
          await _homeApi.fetchMultipleEpisodeApiRequest(urlEpisodes);
      return data;
    } on DioError catch (e) {
      final DioExceptions errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
