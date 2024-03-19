// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        typeId: json["type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "type_id": typeId,
      };
}
