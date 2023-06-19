import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return  Scaffold(
      body: Center(
        child:productsProvider.isLoading?const CircularProgressIndicator() :
        ListView.builder(
            itemCount:productsProvider.products.length ,
            itemBuilder: (BuildContext ctx,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: (){
                      productsProvider.productId=productsProvider.products[index].id;
                      Navigator.pushNamed(context, '/product_details');
                    },
                    child: Text(productsProvider.products[index].title)),
              );

        }),
      )
    );
  }
}
