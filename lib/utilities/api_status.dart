class Success {
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class SuccessCreated {
  int? code;
  Object? response;
  SuccessCreated({this.code, this.response});
}

class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}
