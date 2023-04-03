// import 'package:rick_and_morty/core/network/dio_client.dart';

import 'package:rick_and_morty/core/network/constant/endpoints.dart';
import 'package:rick_and_morty/core/network/dio_client.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/domain/models/episode/episode_model.dart';

class HomeApi {
  final DioClient _dioClient;

  HomeApi(this._dioClient);

  Future<CharacterData> fetchCharactersApiRequest({
    String? nextUrl,
  }) async {
    try {
      final dynamic res = await _dioClient
          .get(nextUrl ?? '${Endpoints.baseUrl}/${Endpoints.character}');
      CharacterData data = CharacterData.fromJson(res.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EpisodeModel>> fetchMultipleEpisodeApiRequest(
    List<String> urlEpisodes,
  ) async {
    try {
      List<String> episodes = <String>[];
      for (int i = 0; i < urlEpisodes.length; i++) {
        String episodeNumber = urlEpisodes[i]
            .split('${Endpoints.baseUrl}/${Endpoints.episode}/')
            .last;
        episodes.add(episodeNumber);
      }
      final dynamic res = await _dioClient.get(
        '${Endpoints.baseUrl}/${Endpoints.episode}/${episodes.join(',')}',
      );
      // ignore: always_specify_types
      late List rawEpisodesList;
      if (res.data is List<dynamic>) {
        // ignore: always_specify_types
        rawEpisodesList = res.data as List? ?? [];
        final List<EpisodeModel> episodesList = rawEpisodesList
            .map((dynamic rawProduct) => EpisodeModel.fromJson(rawProduct))
            .toList();
        return episodesList;
      }
      EpisodeModel episodeModel = EpisodeModel.fromJson(res.data);
      return <EpisodeModel>[episodeModel];
    } catch (e) {
      rethrow;
    }
  }
}
