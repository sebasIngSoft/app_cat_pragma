import 'package:app_cat/domain/data/remote/interface/i_network_api_repository.dart';
import 'package:app_cat/infrastructure/data/remote/error/network_error_http.dart';
import 'package:either_dart/either.dart';

class NetworkApiService {
  final INetworkApiRepository repository;
  NetworkApiService(this.repository);

  Future<Either<NetworkErrorHttp, dynamic>> getResponseApi(String url,
          {Map<String, String>? headers}) =>
      repository.getResponseApi(url, headers: headers);
}
