import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getBrData() async {
    List breweries = [];
    var response =
        await http.get(Uri.https('api.openbrewerydb.org', 'breweries'));
    var jsonData = jsonDecode(response.body);
    // print(response.body);
    for (var i in jsonData) {
      Welcome welcome = Welcome(
        id: i['id'],
        name: i['name'],
        breweryType: i['breweryType'],
        // city: i['city'],
        // state: i['state'],
        // country: i['country'],
        // postalCode: i['postalCode'],
        // phone: i['phone'],
        // street: i['street'],
        // websiteUrl: i['website'],
      );
      breweries.add(welcome);
    }
    print(breweries);
    return breweries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getBrData(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Text('Error'),
              );
            }else return ListView.builder(
              itemCount: snapshot.hasData.toString().length,
              itemBuilder: (BuildContext, i){
                  return ListTile(
                    title: Text(snapshot.hasData.toString()),
                  );
            })
          }),
        ),
      ),
    );
  }
}
