import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utilities/api_status.dart';
import '../utilities/constants.dart';
import 'package:nano_health_task/models/login_model.dart';


class AuthService{
  Future<Object> loginApi({
    required String email,
    required String password
})async{
    final url = Uri.https('fakestoreapi.com', 'auth/login');
    try {
      final response = await http.post(
        url,
        body: {
          "username": email,
          'password': password,
        },
      );
      if (response.statusCode == Ksuccess) {
        return Success(response: loginModelFromJson(response.body));
      } else {
        final responseData = json.decode(response.body);
        return Failure(errorResponse: response.body);
      }
    } on HttpException {
      return Failure(errorResponse: 'sorry something went wrong');
    } on SocketException {
      return Failure(errorResponse: 'no internet connection');
    } on FormatException {
      return Failure(errorResponse: 'sorry something went wrong');
    } catch (error, stackTrace) {
      return Failure(errorResponse: 'oops something went wrong');
    }


  }
}