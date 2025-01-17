// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              
            },
            decoration: const InputDecoration(
              labelText: 'City name',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
