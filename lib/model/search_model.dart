// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  int currentPage;
  int totalPages;
  int totalItems;
  int perPage;
  List<SubCollection> subCollections;

  SearchModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.perPage,
    required this.subCollections,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
        perPage: json["perPage"],
        subCollections: List<SubCollection>.from(
            json["subCollections"].map((x) => SubCollection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
        "perPage": perPage,
        "subCollections":
            List<dynamic>.from(subCollections.map((x) => x.toJson())),
      };
}

class SubCollection {
  String name;
  String collectionId;
  String collectionName;
  String imageUrl;
  String id;

  SubCollection({
    required this.name,
    required this.collectionId,
    required this.collectionName,
    required this.imageUrl,
    required this.id,
  });

  factory SubCollection.fromJson(Map<String, dynamic> json) => SubCollection(
        name: json["name"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "imageUrl": imageUrl,
        "id": id,
      };
}
