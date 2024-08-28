import 'dart:math';

import 'package:app_cat/domain/data/remote/service/network_api_service.dart';
import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:app_cat/infrastructure/data/remote/network_api_repository_http.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_api_repository_http_test.mocks.dart';

@GenerateMocks([NetworkApiRepositoryHttp])
void main() {
  late NetworkApiService apiService;

  setUpAll(() {
    provideDummy<Either<NetworkErrorHttp, dynamic>>(
      Right<NetworkErrorHttp, dynamic>("ok"),
    );
  });
  setUp(() {
    apiService = NetworkApiService(MockNetworkApiRepositoryHttp());
  });
  test('Should return a 200 when making an API request.', () async {
    // Either<NetworkErrorHttp, dynamic> responseExpecte = const Right('200');
    String url = 'http:/ejemplo/api';
    String jsonResponse = '{"key": "value"}';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'x-api-key': '22222dad'
    };

    when(apiService.getResponseApi(url, headers: headers))
        .thenAnswer((_) => Future.value(Right(jsonResponse)));

    Either<NetworkErrorHttp, dynamic> response =
        await apiService.getResponseApi(url, headers: headers);

    expect(response, isA<Right>());
    expect(response, Right(jsonResponse));
  });
  test('Should Left return Left when an exception occurs during the request.',
      () async {
    Either<NetworkErrorHttp, dynamic> responseExpecte =
        Left(NetworkErrorHttp());
    String url = 'http:/ejemplo/api';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'x-api-key': ''
    };

    when(apiService.getResponseApi(url, headers: headers))
        .thenAnswer((_) => Future.value(responseExpecte));

    Either<NetworkErrorHttp, dynamic> response =
        await apiService.getResponseApi(url, headers: headers);

    expect(response, isA<Left>());
    expect(response.isLeft, responseExpecte.isLeft);
  });
}
