import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_complete_guide/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus() async {
    isFavorite = !isFavorite;
    notifyListeners();

    const url = 'geez-shop2-default-rtdb.firebaseio.com';

    final response = await http.patch(Uri.https(url, '/products/$id'),
        body: json.encode({'isFavorite': isFavorite}));

    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
  }
}
