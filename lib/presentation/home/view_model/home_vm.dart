import 'package:app_cat/domain/cat/model/cat.dart';
import 'package:app_cat/domain/data/remote/service/network_api_service.dart';
import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:app_cat/infrastructure/data/remote/network_api_repository_http.dart';
import 'package:app_cat/presentation/description/view/description_pg.dart';
import 'package:app_cat/presentation/home/widgets/custom_card.dart';
import 'package:app_cat/shared/util/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  NetworkApiService apiService = NetworkApiService(NetworkApiRepositoryHttp());
  RxList<Widget> listCard = <Widget>[].obs;
  List<Cat> listCats = [];

  @override
  void onInit() {
    loadInfoCat();
    super.onInit();
  }

  Future<void> loadInfoCat() async {
    List<Cat> result = await getDataApiCats();
    await setCards(listData: result);
  }

  Future<void> setCards({required List<Cat> listData}) async {
    List<Widget> listAuxiliar = [];
    for (var i = 0; i < listData.length; i++) {
      var cat = listData[i];
      if ((cat.urlImage == null || cat.urlImage == null) &&
          cat.referenceImageId != null) {
        cat.urlImage = await getImageCat(cat.referenceImageId!);
      }

      listAuxiliar.add(CustomCard(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        cat: cat,
      ));
    }

    listCard.value = listAuxiliar;
  }

  Future<String> getImageCat(String id) async {
    String urlImage = '';

    Either<NetworkErrorHttp, dynamic> response =
        await apiService.getResponseApi(Constants.apiImageCat + id);
    if (response.isRight) {
      urlImage = await response.right['url'];
    }

    return urlImage;
  }

  Future<List<Cat>> getDataApiCats() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'x-api-key': Constants.apiKey
    };
    Either<NetworkErrorHttp, dynamic> response =
        await apiService.getResponseApi(Constants.apiCats, headers: headers);
    if (response.isRight) {
      listCats = List<Cat>.from(response.right.map((cat) => Cat.fromJson(cat)));
    }
    return listCats;
  }

  searchCat(String value) {
    List<Cat> result = [];
    if (value != '') {
      for (var element in listCats) {
        if (element.name.toLowerCase().contains(value.toLowerCase())) {
          result.add(element);
        }
      }
      setCards(listData: result);
    } else {
      setCards(listData: listCats);
    }
  }

  static HomeViewModel get findOrInitialize {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      return Get.put(HomeViewModel());
    }
  }
}
