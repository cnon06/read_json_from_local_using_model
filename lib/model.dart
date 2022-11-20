// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

List<Car> carFromJson(String str) => List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String carToJson(List<Car> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
    Car({
       required this.carName,
       required this.country,
       required this.foundationYear,
       required this.model,
    });

   final String carName;
   final String country;
   final int foundationYear;
   final List<Model> model;

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        carName: json["car_name"],
        country: json["country"],
        foundationYear: json["foundation_year"],
        model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "car_name": carName,
        "country": country,
        "foundation_year": foundationYear,
        "model": List<dynamic>.from(model.map((x) => x.toJson())),
    };
}

class Model {
    Model({
       required this.modelName,
       required this.price,
       required this.isAutomatic,
    });

    final String modelName;
    final int price;
    final bool isAutomatic;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelName: json["model_name"],
        price: json["price"],
        isAutomatic: json["isAutomatic"],
    );

    Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "price": price,
        "isAutomatic": isAutomatic,
    };
}
