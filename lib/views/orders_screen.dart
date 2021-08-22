import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_studies/providers/orders.dart';
import 'package:state_management_studies/widgets/app_drawer.dart';
import 'package:state_management_studies/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) => OrderWidget(
          orders.items[index],
        ),
      ),
    );
  }
}
