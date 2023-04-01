import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  int id;
  String name;
  @JsonKey(name: 'air_date', defaultValue: '')
  final String? airDate;
  String episode;
  List<dynamic> characters;
  String url;
  String created;

  EpisodeModel({
    required this.id,
    required this.name,
    this.airDate = '',
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
