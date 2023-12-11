class AppExceptions implements Exception {
  final String title, message;
  AppExceptions(this.title, this.message);

  @override
  String toString() {
    // TODO: implement toString
    return "$title - $message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message!, "Error during communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message!, "Bad request");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]) : super(message!, "Unauthorized");
}
