import 'package:json_annotation/json_annotation.dart';

part 'character_data.g.dart';

@JsonSerializable()
class CharacterData {
  @JsonKey(name: 'info')
  final Info? info;

  @JsonKey(name: 'results')
  final List<CharacterModel> characterModels;

  CharacterData({
    this.info,
    required this.characterModels,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDataToJson(this);
}

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  @JsonKey(name: 'status', defaultValue: '-')
  final String? status;
  @JsonKey(name: 'species', defaultValue: '-')
  final String? species;
  @JsonKey(name: 'type', defaultValue: '-')
  final String? type;
  @JsonKey(name: 'gender', defaultValue: '-')
  final String? gender;
  @JsonKey(name: 'origin')
  final Origin? origin;
  @JsonKey(name: 'location')
  final Location? location;
  @JsonKey(name: 'image', defaultValue: '-')
  final String image;
  @JsonKey(name: 'episode', defaultValue: <String>[])
  final List<String>? episode;
  @JsonKey(name: 'url', defaultValue: '-')
  final String? url;
  @JsonKey(name: 'created', defaultValue: '-')
  final String? created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class Origin {
  @JsonKey(name: 'name', defaultValue: '-')
  final String name;
  @JsonKey(name: 'url', defaultValue: '-')
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'name', defaultValue: '-')
  final String name;
  @JsonKey(name: 'url', defaultValue: '-')
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
