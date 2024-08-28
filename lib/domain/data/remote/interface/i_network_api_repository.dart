import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:either_dart/either.dart';

abstract class INetworkApiRepository {
  Future<Either<NetworkErrorHttp, dynamic>> getResponseApi(String url,
      {Map<String, String>? headers});
}
