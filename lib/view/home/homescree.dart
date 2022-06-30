import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/welcome.dart';
import 'package:task/view/home/detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchUsers() async {
    var response = await http.get(
      Uri.https('api.openbrewerydb.org', 'breweries'),
    );
    return jsonDecode(response.body);
  }

  var response;
  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Breweries'),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Breweries',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Breweries Type',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: response,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        DetailedScreen(snapshot.data[index]),);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data[index]['name'] + " "),
                                      trailing: Text(snapshot.data[index]
                                              ['brewery_type'] +
                                          ''),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
