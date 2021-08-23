import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_studies/providers/cart.dart';
import 'package:state_management_studies/providers/orders.dart';
import 'package:state_management_studies/providers/products.dart';
import 'package:state_management_studies/utils/app_routes.dart';
import 'package:state_management_studies/views/cart_screen.dart';
import 'package:state_management_studies/views/orders_screen.dart';
import 'package:state_management_studies/views/product_detail_screen.dart';
import 'package:state_management_studies/views/product_form_screen.dart';
import 'package:state_management_studies/views/products_screen.dart';
import './views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailScreen(),
          AppRoutes.CART: (context) => CartScreen(),
          AppRoutes.ORDERS: (context) => OrdersScreen(),
          AppRoutes.PRODUCTS: (context) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormScreen(),
        },
      ),
    );
  }
}
