import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/features/home/application/home_provider.dart';
import 'package:rick_and_morty/features/home/application/home_state.dart';
import 'package:rick_and_morty/features/home/domain/models/character/character_data.dart';
import 'package:rick_and_morty/features/home/presentation/screens/details_screen.dart';
import 'package:sizer/sizer.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({
    required this.hasInternet,
    required this.ref,
    required this.characterData,
  });

  final bool hasInternet;
  final WidgetRef ref;
  final CharacterData characterData;

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data and update the list
      widget.ref.read(homeDataProvider.notifier).getMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = widget.ref.watch(homeDataProvider);
    final List<CharacterData> datas = state.characterDatas;
    final bool isLoadMoreLoading = state.isLoadMoreLoading;
    final List<CharacterModel> models = datas
        .map((CharacterData data) => data.characterModels)
        .toList()
        .expand((List<CharacterModel> element) => element)
        .toList();
    return SizedBox(
      width: 100.w,
      height: 90.h,
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: models.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index >= models.length) {
            return isLoadMoreLoading
                ? CupertinoActivityIndicator()
                : Container();
          }
          return InkWell(
            onTap: () {
              if (widget.hasInternet) {
                widget.ref
                    .read(homeDataProvider.notifier)
                    .getEpisodes(models[index].episode!);
              }
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => DetailsScreen(
                    characterModel: models[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 20.w,
              height: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _ImageView(models[index]),
                  _NameView(models[index])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  const _ImageView(this.model);
  final CharacterModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 18.h,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: model.image,
          fit: BoxFit.fill,
          errorWidget: (
            BuildContext context,
            String url,
            dynamic error,
          ) {
            return Icon(
              Icons.broken_image,
              size: 132.0,
              color: Colors.blueGrey,
            );
          },
        ),
      ),
    );
  }
}

class _NameView extends StatelessWidget {
  const _NameView(this.model);
  final CharacterModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      child: Text(
        model.name,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
