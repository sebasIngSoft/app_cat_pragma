import 'package:app_cat/domain/cat/model/cat.dart';
import 'package:app_cat/domain/data/remote/service/network_api_service.dart';
import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:app_cat/presentation/home/view_model/home_vm.dart';
import 'package:app_cat/presentation/home/widgets/custom_card.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_vm_test.mocks.dart';

@GenerateMocks([NetworkApiService, HomeViewModel])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeViewModel viewModel;
  late MockNetworkApiService mockApiService;
  final mockCat = Cat(
    weight: Weight(imperial: '7 - 10', metric: '3 - 5'),
    id: 'abys',
    name: 'Abyssinian',
    urlImage: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    cfaUrl: 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
    vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
    vcahospitalsUrl:
        'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
    temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
    origin: 'Egypt',
    countryCodes: 'EG',
    countryCode: 'EG',
    description:
        'The Abyssinian is easy to care for, and a joy to have in your home. The Aby loves people and is a loyal friend.',
    lifeSpan: '14 - 15',
    indoor: 0,
    lap: null,
    altNames: '',
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 3,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 2,
    intelligence: 5,
    sheddingLevel: 2,
    socialNeeds: 5,
    strangerFriendly: 5,
    vocalisation: 1,
    experimental: 0,
    hairless: 0,
    natural: 1,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
    hypoallergenic: 0,
    referenceImageId: '0XYvRd7oD',
  );
  final json = mockCat.toJson();
  setUp(() {
    mockApiService = MockNetworkApiService();
    viewModel = HomeViewModel();
    viewModel.apiService = mockApiService;
  });
  setUpAll(() {
    provideDummy<Either<NetworkErrorHttp, dynamic>>(
      Right<NetworkErrorHttp, dynamic>([json]),
    );
  });

  group('HomeViewModel Test', () {
    testWidgets('loadInfoCat should call getDataApiCats and setCards',
        (WidgetTester tester) async {
      when(mockApiService.getResponseApi(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Right([json]));
      when(mockApiService.getResponseApi(any)).thenAnswer((_) => Future.value(
          Right({'url': 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'})));
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data: MediaQueryData(size: Size(400, 600)),
              child: Obx(() => viewModel.listCard.isEmpty
                  ? Container()
                  : viewModel.listCard.first),
            ),
          ),
        ),
      );
      await viewModel.loadInfoCat();

      verify(mockApiService.getResponseApi(any, headers: anyNamed('headers')))
          .called(2);
    });

    testWidgets('setCards should populate listCard correctly',
        (WidgetTester tester) async {
      final mockCats = [mockCat];
      when(mockApiService.getResponseApi(any)).thenAnswer((_) => Future.value(
          Right({'url': 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'})));
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data: MediaQueryData(size: Size(400, 600)),
              child: Obx(() => viewModel.listCard.isEmpty
                  ? Container()
                  : viewModel.listCard.first),
            ),
          ),
        ),
      );
      await viewModel.setCards(listData: mockCats);

      expect(viewModel.listCard.length, 1);
      expect(viewModel.listCard[0], isA<CustomCard>());
    });

    test('getImageCat should return correct URL when successful', () async {
      const mockUrl = 'http://example.com/cat.jpg';
      when(mockApiService.getResponseApi(any))
          .thenAnswer((_) async => Right({'url': mockUrl}));

      final url = await viewModel.getImageCat('123');

      expect(url, mockUrl);
    });

    test('getImageCat should handle error and return empty string', () async {
      when(mockApiService.getResponseApi(any))
          .thenAnswer((_) async => Left(NetworkErrorHttp('Error')));

      final url = await viewModel.getImageCat('123');

      expect(url, '');
    });

    test('getDataApiCats should return list of cats when successful', () async {
      when(mockApiService.getResponseApi(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Right([json]));

      final cats = await viewModel.getDataApiCats();

      expect(cats.length, 1);
      expect(cats[0].name, 'Abyssinian');
    });
  });
}
