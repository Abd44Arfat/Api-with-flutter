import 'dart:convert';

import 'package:http/http.dart';

import '../Api/api.dart';
import '../model/model.dart';




class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
    await Api().get(url: 'https://jsonplaceholder.typicode.com/photos');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}