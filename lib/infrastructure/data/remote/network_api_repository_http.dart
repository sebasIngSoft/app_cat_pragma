import 'dart:convert';

import 'package:app_cat/domain/data/remote/interface/i_network_api_repository.dart';

import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiRepositoryHttp implements INetworkApiRepository {
  @override
  Future<Either<NetworkErrorHttp, dynamic>> getResponseApi(String url,
      {Map<String, String>? headers}) async {
    var uri = Uri.parse(url);
    late var response;
    try {
      response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: 40));
    } catch (e) {
      response = Left(e);
    }

    return returnResponse(response, true);
  }

  Either<NetworkErrorHttp, dynamic> returnResponse(
      http.Response response, bool isJson) {
    if (response.contentLength == 0) {
      return Left(
          FetchDataException('Error occured while communication with server'));
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        if (isJson) {
          Object responseJson = jsonDecode(response.body);
          return Right(responseJson);
        } else {
          return Right(response.bodyBytes);
        }
      case 400:
        if (isJson) {
          dynamic responseJson = jsonDecode(response.body);

          return Left(
              BadRequestException(responseJson['message'], responseJson));
        } else {
          var error =
              'Error occured while communication with server with status code : ${response.statusCode}, message: ${response.body}';

          Get.printError(info: '400 $error');

          return Left(BadRequestException(error));
        }

      case 401:
      case 403:
        dynamic responseJson = jsonDecode(response.body);
        Get.printError(info: '403 $responseJson');

        return Left(BadRequestException(responseJson['message']));
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        Get.printError(info: '404 $responseJson');
        return Left(BadRequestException(responseJson['message']));
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        Get.printError(info: '500 ${responseJson['message']}');
        return Left(BadRequestException(responseJson['message']));
      case 502:
        dynamic responseJson = response.statusCode.toString();
        Get.printError(info: '502 $responseJson');
        return Left(BadGateway(
            "Error occured while communication with server with status code : ${response.statusCode}"));
      default:
        return Left(FetchDataException(
            'Error occured while communication with server'
            ' with status code : ${response.statusCode}, message: ${response.body}'));
    }
  }
}
