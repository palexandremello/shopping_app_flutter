import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:state_management_studies/providers/orders.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  OrderWidget(this.order);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.totalAmount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyy hh:mm').format(widget.order.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: (widget.order.products.length * 25.0) + 10,
              child: ListView(
                children: widget.order.products.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${product.quantity} x R\$${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
