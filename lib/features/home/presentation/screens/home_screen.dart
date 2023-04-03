import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/application/home_state.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/presentation/widgets/character_list_view.dart';
import 'package:rick_and_morty/features/home/application/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoading = ref.watch(homeDataProvider).isLoading;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const _RickAndMortyItems(),
      ),
    );
  }
}

class _RickAndMortyItems extends ConsumerWidget {
  const _RickAndMortyItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeDataProvider);
    final CharacterData characterData = state.characterDatas.first;
    return characterData.characterModels.isEmpty
        ? const _EmptyDisplayView()
        : CharacterListView(
            characterData: characterData,
            ref: ref,
          );
  }
}

class _EmptyDisplayView extends StatelessWidget {
  const _EmptyDisplayView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 150,
          left: 8,
          right: 8,
        ),
        child: Text(
          'There are no any characters.',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
