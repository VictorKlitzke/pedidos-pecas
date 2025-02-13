import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ListServicesComponents extends StatefulWidget {
  final List<String> services;

  ListServicesComponents({required this.services});

  @override
  _ListServicesComponentsState createState() => _ListServicesComponentsState();
}

class _ListServicesComponentsState extends State<ListServicesComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 200.0, autoPlay: true),
          items: widget.services.map((service) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Center(
                    child: Text(
                      service,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
