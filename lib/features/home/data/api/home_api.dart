// import 'package:rick_and_morty/core/network/dio_client.dart';

import 'package:rick_and_morty/core/network/constant/endpoints.dart';
import 'package:rick_and_morty/core/network/dio_client.dart';
import 'package:rick_and_morty/features/home/data/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/data/models/episode/episode_model.dart';

class HomeApi {
  final DioClient _dioClient;

  HomeApi(this._dioClient);

  Future<CharacterData> fetchCharactersApiRequest() async {
    try {
      final dynamic res =
          await _dioClient.get('${Endpoints.baseUrl}/${Endpoints.character}');
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
      final List<dynamic> rawEpisodesList = res.data as List? ?? <dynamic>[];
      final List<EpisodeModel> episodesList = rawEpisodesList
          .map((dynamic rawProduct) => EpisodeModel.fromJson(rawProduct))
          .toList();
      return episodesList;
    } catch (e) {
      rethrow;
    }
  }
}
