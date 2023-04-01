import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/shared_provider/shared_providers.dart';
import 'package:rick_and_morty/features/home/data/api/home_api.dart';
import 'package:rick_and_morty/features/home/data/models/home_state.dart';
import 'package:rick_and_morty/features/home/data/repository/home_repository.dart';
import 'package:rick_and_morty/features/home/provider/home_state_provider.dart';

final Provider<HomeApi> homeApiProvider =
    Provider<HomeApi>((ProviderRef<HomeApi> ref) {
  return HomeApi(ref.read(dioClientProvider));
});

final Provider<HomeRepository> homeRepositoryProvider =
    Provider<HomeRepository>((ProviderRef<HomeRepository> ref) {
  return HomeRepository(ref.read(homeApiProvider));
});

final StateNotifierProvider<HomeDataNotifier, HomeState> homeDataProvider =
    StateNotifierProvider<HomeDataNotifier, HomeState>(
        (StateNotifierProviderRef<HomeDataNotifier, HomeState> ref) {
  return HomeDataNotifier(ref.read(homeRepositoryProvider));
});
