import '../data/model.dart';

abstract class QuoteState {}

// - Initial (empty) state
// - Loading state (show progress indicator)
// - Success state (show data)
// - Error state (show error message)
//

class QuoteInitialState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteSuccessState extends QuoteState {
  final QuotesDataModel quotesDataModel;

  QuoteSuccessState({required this.quotesDataModel});
}

class QuoteErrorState extends QuoteState {
  String error;

  QuoteErrorState({required this.error});
}
