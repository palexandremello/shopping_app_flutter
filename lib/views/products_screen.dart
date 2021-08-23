import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_studies/providers/products.dart';
import 'package:state_management_studies/utils/app_routes.dart';
import 'package:state_management_studies/widgets/app_drawer.dart';
import 'package:state_management_studies/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productItems = products.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (context, item) => Column(
            children: [
              ProductItem(
                productItems[item],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
