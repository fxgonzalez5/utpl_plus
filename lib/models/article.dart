import 'dart:convert';

class Article {
    final String id;
    final String title;
    final String description;
    final ImageA image;
    final DateTime date;
    final List<RelatedA> related;
    final String interaction;
    final Endpoint endpoint;

    Article({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.date,
        required this.related,
        required this.interaction,
        required this.endpoint,
    });

    factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: ImageA.fromMap(json["image"]),
        date: DateTime.parse(json["date"]),
        related: List<RelatedA>.from(json["related"].map((x) => RelatedA.fromMap(x))),
        interaction: json["interaction"],
        endpoint: Endpoint.fromMap(json["endpoint"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image.toMap(),
        "date": date.toIso8601String(),
        "related": List<dynamic>.from(related.map((x) => x.toMap())),
        "interaction": interaction,
        "endpoint": endpoint.toMap(),
    };
}

class Endpoint {
    final String urlBase;
    final String urlPath;
    final bool authentication;
    final String version;
    final String method;
    final dynamic headers;
    final List<dynamic> queryParams;
    final List<PathVariable> pathVariables;
    final Gui gui;

    Endpoint({
        required this.urlBase,
        required this.urlPath,
        required this.authentication,
        required this.version,
        required this.method,
        this.headers,
        required this.queryParams,
        required this.pathVariables,
        required this.gui,
    });

    factory Endpoint.fromJson(String str) => Endpoint.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Endpoint.fromMap(Map<String, dynamic> json) => Endpoint(
        urlBase: json["url_base"],
        urlPath: json["url_path"],
        authentication: json["authentication"],
        version: json["version"],
        method: json["method"],
        headers: json["headers"],
        queryParams: List<dynamic>.from(json["query_params"].map((x) => x)),
        pathVariables: List<PathVariable>.from(json["path_variables"].map((x) => PathVariable.fromMap(x))),
        gui: Gui.fromMap(json["gui"]),
    );

    Map<String, dynamic> toMap() => {
        "url_base": urlBase,
        "url_path": urlPath,
        "authentication": authentication,
        "version": version,
        "method": method,
        "headers": headers,
        "query_params": List<dynamic>.from(queryParams.map((x) => x)),
        "path_variables": List<dynamic>.from(pathVariables.map((x) => x.toMap())),
        "gui": gui.toMap(),
    };
}

class Gui {
    final String layout;
    final dynamic cardtype;

    Gui({
        required this.layout,
        this.cardtype,
    });

    factory Gui.fromJson(String str) => Gui.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Gui.fromMap(Map<String, dynamic> json) => Gui(
        layout: json["layout"],
        cardtype: json["cardtype"],
    );

    Map<String, dynamic> toMap() => {
        "layout": layout,
        "cardtype": cardtype,
    };
}

class PathVariable {
    final String name;
    final String value;
    final String type;
    final dynamic defaultValue;

    PathVariable({
        required this.name,
        required this.value,
        required this.type,
        this.defaultValue,
    });

    factory PathVariable.fromJson(String str) => PathVariable.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PathVariable.fromMap(Map<String, dynamic> json) => PathVariable(
        name: json["name"],
        value: json["value"],
        type: json["type"],
        defaultValue: json["default_value"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
        "type": type,
        "default_value": defaultValue,
    };
}

class ImageA {
    final String url;
    final String thumb;
    final String medium;

    ImageA({
        required this.url,
        required this.thumb,
        required this.medium,
    });

    factory ImageA.fromJson(String str) => ImageA.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImageA.fromMap(Map<String, dynamic> json) => ImageA(
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

class RelatedA {
    final String type;
    final String id;
    final String name;
    final bool deprecated;
    final bool enable;

    RelatedA({
        required this.type,
        required this.id,
        required this.name,
        required this.deprecated,
        required this.enable,
    });

    factory RelatedA.fromJson(String str) => RelatedA.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RelatedA.fromMap(Map<String, dynamic> json) => RelatedA(
        type: json["type"],
        id: json["id"],
        name: json["name"],
        deprecated: json["deprecated"],
        enable: json["enable"],
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "name": name,
        "deprecated": deprecated,
        "enable": enable,
    };
}
