class NetworkErrorHttp implements Exception {
  final String? _message;
  final String? _prefix;
  final dynamic body;

  NetworkErrorHttp([this._message, this._prefix, this.body]);

  @override
  String toString() {
    return "$_prefix$_message${body != null ? "\nBody: $body" : ""}";
  }
}

class FetchDataException extends NetworkErrorHttp {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkErrorHttp {
  BadRequestException([String? message, body])
      : super(message, "Bad Request: ", body);
}

class UnauthorisedException extends NetworkErrorHttp {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends NetworkErrorHttp {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class BadGateway extends NetworkErrorHttp {
  BadGateway([String? message]) : super(message, "Bad Gateway: ");
}
