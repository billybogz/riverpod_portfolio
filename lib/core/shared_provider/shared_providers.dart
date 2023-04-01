import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/network/dio_client.dart';

final Provider<Dio> dioInstanceProvider = Provider<Dio>((ProviderRef<Dio> ref) {
  return Dio();
});

final Provider<DioClient> dioClientProvider =
    Provider<DioClient>((ProviderRef<DioClient> ref) {
  final Dio dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});
