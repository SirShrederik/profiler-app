import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profiler/core/presentation/names_page.dart';
//import 'package:profiler/feature/request_configuration/presentation/names_configuaration.dart';

class ProfilerApp extends StatefulWidget {
  const ProfilerApp({super.key});

  @override
  State<ProfilerApp> createState() => _ProfilerAppState();
}

class _ProfilerAppState extends State<ProfilerApp> {
  final _textController = TextEditingController();
  String userInput = "";
  List<NamesList> names = [];

  Future getNames () async {
    var response = await http.get(Uri.https('https://api.agify.io?name=michael&country_id=US'));
    var jsonData = jsonDecode(response.body);

    for (var eachName in jsonData['data']) {
      final name = NamesList(count: eachName['count'], name: eachName['name'], age: eachName['age'], countryId: eachName['countryId'],);
      names.add(name);
    }
    print(names.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Whats your name?'),
          actions: [Icon(Icons.arrow_right)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(child: Text(userInput)),
                ),
              ),
              TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      hintText: 'Type in your first name.',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ))),
                    //  FirstNameTextField(controller: _FirstNameController,
                    //  onFirstNameChanged: (firstName) {

                    //  },),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userInput = _textController.text;
                  });
                  //fetchData();
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ));
  }
}


