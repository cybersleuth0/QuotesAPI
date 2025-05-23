import 'package:dummyapi_one/Bloc/quotes_bloc.dart';
import 'package:dummyapi_one/Bloc/quotes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/quotes_event.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    //Call the Api
    context.read<QuotesBloc>().add(GetQuotesEvent());
  }

  // Future<QuotesDataModel> getQuotesViaAPI() async {
  //   String url = "https://dummyjson.com/quotes";
  //   var response = await http.get(Uri.parse(url));
  //   Map<String, dynamic> mData = jsonDecode(response.body);
  //   return QuotesDataModel.fromJson(mData);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quotes Api"),
        ),
        body: BlocBuilder<QuotesBloc, QuoteState>(builder: (_, state) {
          if (state is QuoteLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is QuoteErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is QuoteSuccessState) {
            var snap = state.quotesDataModel;
            return ListView.builder(
                itemCount: snap.quotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snap.quotes[index].quote),
                      subtitle: Text("Author: ${snap.quotes[index].author}"),
                    ),
                  );
                });
          }
          return Container();
        }));
  }
}


//* FutureBuilder*//
//body: FutureBuilder(
//     future: getQuotesViaAPI(),
//     builder: (_, snap) {
//       if (snap.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       }
//       if (snap.hasError) {
//         return Center(child: Text("${snap.error}"));
//       }
//       if (snap.hasData) {
//         return ListView.builder(
//             itemCount: snap.data!.quotes.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: ListTile(
//                   title: Text(snap.data!.quotes[index].quote),
//                   subtitle: Text(
//                       "Author: ${snap.data!.quotes[index].author}"),
//                 ),
//               );
//             });
//       }
//       return Container();
//     }))