import 'dart:convert';

import 'package:flutter/material.dart';

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
    final jsonData = jsonDecode(data);
    final List listData = jsonData as List;

    int brand = 1, model =5;
    if (brand > listData.length - 1) brand = listData.length - 1;
    if (model > listData[brand]["model"].length - 1) model = listData[brand]["model"].length - 1;

    debugPrint("Car Name: ${listData[brand]["car_name"]}");
    debugPrint("Country: ${listData[brand]["country"]}");
    debugPrint("Foundation Year: ${listData[brand]["foundation_year"]}");
    debugPrint("Model Name: ${listData[brand]["model"][model]["model_name"]}");
    debugPrint("Price: \$${listData[brand]["model"][model]["price"]}");
    debugPrint("Is It Automatic?: ${listData[brand]["model"][model]["isAutomatic"]}");

    // "model":
    //debugPrint(getData.characters.toString());
  }
}
