import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class oldHomepage extends StatefulWidget {
  const oldHomepage({super.key});

  @override
  State<oldHomepage> createState() => _HomepageState();
}

class _HomepageState extends State<oldHomepage> {
  Map<String, dynamic> quotes = {};

  @override
  void initState() {
    super.initState();
    getQuotesViaAPI();
  }

  void getQuotesViaAPI() async {
    String url = "https://dummyjson.com/quotes";
    var response = await http.get(Uri.parse(url));
    quotes = jsonDecode(response.body);
    setState(() {
      print(quotes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quotes Api"),
        ),
        body: quotes != null
            ? ListView.builder(
                itemCount: quotes["quotes"].length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(quotes["quotes"][index]["quote"]),
                      subtitle: Text(quotes["quotes"][index]["author"]),
                    ),
                  );
                })
            : Text("Not Data"));
  }
}
