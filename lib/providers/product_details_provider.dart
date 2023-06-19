import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsProvider extends ChangeNotifier{

  final Locator read;
  ProductDetailsProvider(this.read){
    printid();

  }


printid(){
    print(    read<ProductsProvider>().productId
    );
}

}