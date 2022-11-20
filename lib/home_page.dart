import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_json_from_local/model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    carsJsonRead();

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }

  Future<void> carsJsonRead() async {
    final data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cars.json");
  

    debugPrint("*******************************");
    printCars(car: 0, model: 0, data: data);
     debugPrint("*******************************");
    printCars(car: 0, model: 1, data: data);
     debugPrint("*******************************");
    printCars(car: 0, model: 2, data: data);
     debugPrint("*******************************");
    printCars(car: 1, model: 0, data: data);
     debugPrint("*******************************");
    printCars(car: 1, model: 1, data: data);
    debugPrint("*******************************");
    printCars(car: 1, model: 2, data: data);
     debugPrint("*******************************");
    printCars(car: 1, model: 3, data: data);
     debugPrint("*******************************");
    printCars(car: 2, model: 0, data: data);
     debugPrint("*******************************");
    printCars(car: 2, model: 1, data: data);
  }

  void printCars({required int car, required int model, required String data}) {
    List<Car> carList = carFromJson(data);
    debugPrint( "Car Name: ${carList[car].carName}");
    debugPrint("Country: ${carList[car].country}");
    debugPrint("Foundation Year: ${carList[car].foundationYear.toString()}");
    debugPrint("Model Name: ${carList[car].model[model].modelName}");
    debugPrint("Price: \$${carList[car].model[model].price.toString()}");
    debugPrint("Is It Automatic? : ${carList[car].model[model].isAutomatic.toString()}");
  }
}
