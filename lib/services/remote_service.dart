import 'dart:convert';

import 'package:adminui/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Product>?> getProduct() async {
    var client = http.Client();
    var uri = Uri.parse('https://localhost:7111/ProductApi/GetAll');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    }
  }

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse('https://localhost:7111/ProductApi/CreateProduct'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": product.name,
        "description": product.description,
        "price": product.price,
        "stars": product.stars,
        "img": product.img,
        "location": product.location,
        "created_at": product.createdAt,
        "updated_at": product.updatedAt,
        "type_id": product.typeId
      }),
    );
    if (response.statusCode == 201) {
      return Product.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create Product.');
    }
  }

  Future<Product> deleteProduct(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(
          'https://localhost:7111/ProductApi/DeleteProduct$id?ProductID=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print("status code: ${response.statusCode}");
//Check cai return ntn
    if (response.statusCode == 200) {
      return Product.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete album.');
    }
  }

  Future<Product> updateProduct(String id, Product product) async {
    final http.Response response = await http.put(
      Uri.parse(
          'https://localhost:7111/ProductApi/UpdateProduct$id?ProductID=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "id": product.id,
        "name": product.name,
        "description": product.description,
        "price": product.price,
        "stars": product.stars,
        "img": product.img,
        "location": product.location,
        "created_at": product.createdAt,
        "updated_at": product.updatedAt,
        "type_id": product.typeId
      }),
    );
    print("Reponse: ${response.statusCode}");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Product.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }
}
