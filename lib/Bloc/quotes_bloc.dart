import 'package:dummyapi_one/Api_Helper/api_helper.dart';
import 'package:dummyapi_one/Bloc/quotes_event.dart';
import 'package:dummyapi_one/Bloc/quotes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model.dart';
import '../urls/urls.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuoteState> {
  Api_helper api_helper;

  QuotesBloc({required this.api_helper}) : super(QuoteInitialState()) {
    on<GetQuotesEvent>((event, emit) async {
      emit(QuoteLoadingState());
      var responseJson = await api_helper.getApi(url: Urls.getQuotesURL);
      var fromJson = QuotesDataModel.fromJson(responseJson);
      if (responseJson != null) {
        emit(QuoteSuccessState(quotesDataModel: fromJson));
      } else {
        emit(QuoteErrorState(error: "Something went wrong"));
      }
    });
  }
}
