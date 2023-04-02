// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, top_level_function_literal_block, depend_on_referenced_packages, always_specify_types, require_trailing_commas

import 'package:flutter_data/flutter_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: prefer_function_declarations_over_variables
ConfigureRepositoryLocalStorage configureRepositoryLocalStorage = (
    {FutureFn<String>? baseDirFn,
    List<int>? encryptionKey,
    LocalStorageClearStrategy? clear}) {
  if (!kIsWeb) {
  } else {
    baseDirFn ??= () => '';
  }

  return hiveLocalStorageProvider.overrideWith(
    (ref) => HiveLocalStorage(
      hive: ref.read(hiveProvider),
      baseDirFn: baseDirFn,
      encryptionKey: encryptionKey,
      clear: clear,
    ),
  );
};

final repositoryProviders = <String, Provider<Repository<DataModel>>>{};

final repositoryInitializerProvider =
    FutureProvider<RepositoryInitializer>((ref) async {
  final adapters = <String, RemoteAdapter>{};
  final remotes = <String, bool>{};

  await ref.watch(graphNotifierProvider).initialize();

  // initialize and register
  for (final type in repositoryProviders.keys) {
    final repository = ref.read(repositoryProviders[type]!);
    repository.dispose();
    await repository.initialize(
      remote: remotes[type],
      adapters: adapters,
    );
    internalRepositories[type] = repository;
  }

  return RepositoryInitializer();
});

extension RepositoryWidgetRefX on WidgetRef {}

extension RepositoryRefX on Ref {}
