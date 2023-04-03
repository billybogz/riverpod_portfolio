import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/shared_provider/shared_providers.dart';
import 'package:rick_and_morty/features/home/infrastructure/datasources/remote/home_api.dart';
import 'package:rick_and_morty/features/home/application/home_state.dart';
import 'package:rick_and_morty/features/home/infrastructure/repositories/home_repository.dart';
import 'package:rick_and_morty/features/home/infrastructure/repositories/local_home_repository.dart';
import 'package:rick_and_morty/features/home/application/home_state_provider.dart';

final Provider<HomeApi> homeApiProvider =
    Provider<HomeApi>((ProviderRef<HomeApi> ref) {
  return HomeApi(ref.read(dioClientProvider));
});

final Provider<HomeRepository> homeRepositoryProvider =
    Provider<HomeRepository>((ProviderRef<HomeRepository> ref) {
  return HomeRepository(ref.read(homeApiProvider));
});

final Provider<LocalHomeRepository> localHomeRepositoryProvider =
    Provider<LocalHomeRepository>((ProviderRef<LocalHomeRepository> ref) {
  return LocalHomeRepository();
});

final StateNotifierProvider<HomeDataNotifier, HomeState> homeDataProvider =
    StateNotifierProvider<HomeDataNotifier, HomeState>(
        (StateNotifierProviderRef<HomeDataNotifier, HomeState> ref) {
  return HomeDataNotifier(
    ref.read(homeRepositoryProvider),
    ref.read(localHomeRepositoryProvider),
  );
});
