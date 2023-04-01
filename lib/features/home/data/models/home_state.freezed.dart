// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  CharacterData? get characterData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<EpisodeModel> get episodeModels => throw _privateConstructorUsedError;
  bool get isEpisodeLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {CharacterData? characterData,
      bool isLoading,
      List<EpisodeModel> episodeModels,
      bool isEpisodeLoading});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterData = freezed,
    Object? isLoading = null,
    Object? episodeModels = null,
    Object? isEpisodeLoading = null,
  }) {
    return _then(_value.copyWith(
      characterData: freezed == characterData
          ? _value.characterData
          : characterData // ignore: cast_nullable_to_non_nullable
              as CharacterData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      episodeModels: null == episodeModels
          ? _value.episodeModels
          : episodeModels // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
      isEpisodeLoading: null == isEpisodeLoading
          ? _value.isEpisodeLoading
          : isEpisodeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CharacterData? characterData,
      bool isLoading,
      List<EpisodeModel> episodeModels,
      bool isEpisodeLoading});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterData = freezed,
    Object? isLoading = null,
    Object? episodeModels = null,
    Object? isEpisodeLoading = null,
  }) {
    return _then(_$_HomeState(
      characterData: freezed == characterData
          ? _value.characterData
          : characterData // ignore: cast_nullable_to_non_nullable
              as CharacterData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      episodeModels: null == episodeModels
          ? _value._episodeModels
          : episodeModels // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
      isEpisodeLoading: null == isEpisodeLoading
          ? _value.isEpisodeLoading
          : isEpisodeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {this.characterData,
      this.isLoading = true,
      final List<EpisodeModel> episodeModels = const <EpisodeModel>[],
      this.isEpisodeLoading = true})
      : _episodeModels = episodeModels;

  @override
  final CharacterData? characterData;
  @override
  @JsonKey()
  final bool isLoading;
  final List<EpisodeModel> _episodeModels;
  @override
  @JsonKey()
  List<EpisodeModel> get episodeModels {
    if (_episodeModels is EqualUnmodifiableListView) return _episodeModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodeModels);
  }

  @override
  @JsonKey()
  final bool isEpisodeLoading;

  @override
  String toString() {
    return 'HomeState(characterData: $characterData, isLoading: $isLoading, episodeModels: $episodeModels, isEpisodeLoading: $isEpisodeLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.characterData, characterData) ||
                other.characterData == characterData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._episodeModels, _episodeModels) &&
            (identical(other.isEpisodeLoading, isEpisodeLoading) ||
                other.isEpisodeLoading == isEpisodeLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterData, isLoading,
      const DeepCollectionEquality().hash(_episodeModels), isEpisodeLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final CharacterData? characterData,
      final bool isLoading,
      final List<EpisodeModel> episodeModels,
      final bool isEpisodeLoading}) = _$_HomeState;

  @override
  CharacterData? get characterData;
  @override
  bool get isLoading;
  @override
  List<EpisodeModel> get episodeModels;
  @override
  bool get isEpisodeLoading;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
