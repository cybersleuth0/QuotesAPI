import 'package:dummyapi_one/Api_Helper/api_helper.dart';
import 'package:dummyapi_one/Bloc/quotes_bloc.dart';
import 'package:dummyapi_one/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider<QuotesBloc>(
      create: (context) => QuotesBloc(api_helper: Api_helper()),
      child: Homepage(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
