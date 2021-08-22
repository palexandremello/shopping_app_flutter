import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_studies/providers/products.dart';
import 'package:state_management_studies/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);
  @override
  Widget build(BuildContext context) {
    final productsProviders = Provider.of<Products>(context);
    final products = showFavoriteOnly
        ? productsProviders.favoriteItems
        : productsProviders.items;

    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
