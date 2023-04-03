import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/network/dio_exceptions.dart';
import 'package:rick_and_morty/features/home/infrastructure/datasources/remote/home_api.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/domain/models/episode/episode_model.dart';

class HomeRepository {
  final HomeApi _homeApi;

  HomeRepository(this._homeApi);

  Future<CharacterData> fetchCharacters({
    String? nextUrl,
  }) async {
    try {
      final CharacterData data =
          await _homeApi.fetchCharactersApiRequest(nextUrl: nextUrl);
      return data;
    } on DioError catch (e) {
      final DioExceptions errorMessage = DioExceptions.fromDioError(e);
      log('💀 errorMessage: ${errorMessage.toString()}');
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
