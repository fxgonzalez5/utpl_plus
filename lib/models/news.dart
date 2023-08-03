// To parse this JSON data, do
//
//     final news = newsFromMap(jsonString);

import 'dart:convert';

import 'package:utpl_plus/models/models.dart';

class News {
    final int status;
    final int page;
    final int total;
    final List<Article> data;

    News({
        required this.status,
        required this.page,
        required this.total,
        required this.data,
    });

    factory News.fromJson(String str) => News.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory News.fromMap(Map<String, dynamic> json) => News(
        status: json["status"],
        page: json["page"],
        total: json["total"],
        data: List<Article>.from(json["data"].map((x) => Article.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "page": page,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}