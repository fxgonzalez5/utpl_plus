import 'dart:convert';

class Information {
    final String id;
    final String title;
    final List<Related> related;
    final String interaction;
    final String description;
    final dynamic view;
    final dynamic date;
    final dynamic source;
    final ImageI image;
    final dynamic video;
    final bool deprecated;
    final bool enable;
    final dynamic endpoint;

    Information({
        required this.id,
        required this.title,
        required this.related,
        required this.interaction,
        required this.description,
        this.view,
        this.date,
        this.source,
        required this.image,
        this.video,
        required this.deprecated,
        required this.enable,
        this.endpoint,
    });

    factory Information.fromJson(String str) => Information.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Information.fromMap(Map<String, dynamic> json) => Information(
        id: json["id"],
        title: json["title"],
        related: List<Related>.from(json["related"].map((x) => Related.fromMap(x))),
        interaction: json["interaction"],
        description: json["description"],
        view: json["view"],
        date: json["date"],
        source: json["source"],
        image: ImageI.fromMap(json["image"]),
        video: json["video"],
        deprecated: json["deprecated"],
        enable: json["enable"],
        endpoint: json["endpoint"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "related": List<dynamic>.from(related.map((x) => x.toMap())),
        "interaction": interaction,
        "description": description,
        "view": view,
        "date": date,
        "source": source,
        "image": image.toMap(),
        "video": video,
        "deprecated": deprecated,
        "enable": enable,
        "endpoint": endpoint,
    };
}

class ImageI {
    final String url;
    final String thumb;
    final String medium;

    ImageI({
        required this.url,
        required this.thumb,
        required this.medium,
    });

    factory ImageI.fromJson(String str) => ImageI.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImageI.fromMap(Map<String, dynamic> json) => ImageI(
        url: json["url"],
        thumb: json["thumb"],
        medium: json["medium"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
        "thumb": thumb,
        "medium": medium,
    };
}

class Related {
    final String type;
    final String name;
    final dynamic identifier;

    Related({
        required this.type,
        required this.name,
        this.identifier,
    });

    factory Related.fromJson(String str) => Related.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Related.fromMap(Map<String, dynamic> json) => Related(
        type: json["type"],
        name: json["name"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "identifier": identifier,
    };
}
