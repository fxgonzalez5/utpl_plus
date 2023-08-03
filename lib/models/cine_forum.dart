// To parse this JSON data, do
//
//     final cineForum = cineForumFromMap(jsonString);

import 'dart:convert';

import 'package:utpl_plus/models/models.dart';

class CineForum {
    final int total;
    final int status;
    final String page;
    final List<Information> data;

    CineForum({
        required this.total,
        required this.status,
        required this.page,
        required this.data,
    });

    factory CineForum.fromJson(String str) => CineForum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CineForum.fromMap(Map<String, dynamic> json) => CineForum(
        total: json["total"],
        status: json["status"],
        page: json["page"],
        data: List<Information>.from(json["data"].map((x) => Information.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "status": status,
        "page": page,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}