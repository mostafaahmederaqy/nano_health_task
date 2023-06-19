import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/product_details_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider<ProductDetailsProvider>(
        create: (context) => ProductDetailsProvider(context.read),
        child: ProductDetailsScreenBody());
  }
}


class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProductDetailsProvider>(context);

    return const Placeholder();
  }
}

