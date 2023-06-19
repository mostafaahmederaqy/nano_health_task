import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/products_service.dart';
import '../utilities/api_status.dart';

class ProductsProvider extends ChangeNotifier{
  ProductsProvider(){
    fetchProducts();
  }

  int? _productId;

  int? get productId => _productId;

  set productId(int? value) {
    _productId = value;
  }


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProductsModel> _products=[];

  List<ProductsModel> get products => _products;

  set products(List<ProductsModel> value) {
    _products = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    final result = await ProductsService().productsApi();
    if (result is Success) {
      isLoading = false;
      final personsResponse = result.response as List<ProductsModel>;
      products = personsResponse;
    }
  }

}