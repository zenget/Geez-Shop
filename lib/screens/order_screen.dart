import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart' show Orders;
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    print(orders.orders.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (context, index) {
          return OrderItem(orders.orders[index]);
        },
      ),
      drawer: MainDrawer(),
    );
  }
}
