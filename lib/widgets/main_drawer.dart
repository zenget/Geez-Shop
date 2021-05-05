import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/order_screen.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Geez Shop'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildListTile('Home', Icons.shop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Orders', Icons.payment, () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          }),
          buildListTile('Manage Products', Icons.edit, () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
