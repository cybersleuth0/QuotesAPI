import 'dart:convert';

import 'package:dummyapi_one/data/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<QuotesDataModel> getQuotesViaAPI() async {
    String url = "https://dummyjson.com/quotes";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> mData = jsonDecode(response.body);
    return QuotesDataModel.fromJson(mData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quotes Api"),
        ),
        body: FutureBuilder(
            future: getQuotesViaAPI(),
            builder: (_, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snap.hasError) {
                return Center(child: Text("${snap.error}"));
              }
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: snap.data!.quotes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(snap.data!.quotes[index].quote),
                        ),
                      );
                    });
              }
              return Container();
            }));
  }
}


// body: mData != null
//     ? ListView.builder(
//         itemCount: mData["quotes"].length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(mData["quotes"][index]["quote"]),
//               subtitle: Text(mData["quotes"][index]["author"]),
//             ),
//           );
//         })
//     : Text("Not Data"));