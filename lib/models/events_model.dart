// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
    EventsModel({
        required this.status,
        required this.data,
    });

    String status;
    List<Datum> data;

    factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.poster,
        required this.name,
        required this.description,
        required this.date,
        required this.location,
        required this.type,
    });

    String poster;
    String name;
    String description;
    DateTime date;
    String location;
    String type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        poster: json["poster"],
        name: json["name"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        location: json["location"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "poster": poster,
        "name": name,
        "description": description,
        "date": date.toIso8601String(),
        "location": location,
        "type": type,
    };
}
