import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/products_model.dart';
import '../utilities/api_status.dart';
import '../utilities/constants.dart';

class ProductsService{
  Future<Object> productsApi()async{
    final url = Uri.https('fakestoreapi.com', 'products');
    try {
      final response = await http.get(
        url,
      );
      if (response.statusCode == Ksuccess) {
        return Success(response: productsModelFromJson(response.body));
      } else {
        final responseData = json.decode(response.body);
        return Failure(errorResponse: response.body);
      }
    }on HttpException {
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