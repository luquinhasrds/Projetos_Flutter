// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conversor/components/current_box.dart';
import 'package:conversor/controler/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20, top: 100, left: 30, right: 30,),
          child: Column(
            children: [
              Image.asset('assets/dinheiro.png', width: 150, height: 150,),
              SizedBox(height: 50,),
              CurrentBox(
                selectedCurrency: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model){
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },

              ),   //linha de moeda
              SizedBox(height: 10,),
              CurrentBox(
                selectedCurrency: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model){
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },),   //linha de moeda
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white
                ),
                onPressed: () {
                  homeController.convert();
                },
                child: Text('Converter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}