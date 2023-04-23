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
        required this.id,
        required this.poster,
        required this.name,
        required this.description,
        required this.date,
        required this.time,
        required this.location,
        required this.type,
    });

    int id;
    String poster;
    String name;
    String description;
    DateTime date;
    String time;
    String location;
    String type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        poster: json["poster"],
        name: json["name"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        location: json["location"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "poster": poster,
        "name": name,
        "description": description,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "location": location,
        "type": type,
    };
}
