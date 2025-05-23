
# QuotesAPI

A Flutter application that displays quotes from a public API using the BLoC pattern for state management. The app demonstrates clean architecture, asynchronous data fetching, and robust UI state handling.

## Features

- Fetches quotes from [dummyjson.com/quotes](https://dummyjson.com/quotes)
- Clean separation of concerns using the BLoC pattern
- Displays quotes in a scrollable list with author attribution
- Loading and error handling
- Modular codebase for easy maintenance and extension

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/cybersleuth0/QuotesAPI.git
   cd QuotesAPI
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── Api_Helper/
│   └── api_helper.dart         # Handles API requests
├── Bloc/
│   ├── quotes_bloc.dart        # BLoC logic for fetching quotes
│   ├── quotes_event.dart       # Events for BLoC
│   └── quotes_state.dart       # States for BLoC
├── data/
│   └── model.dart              # Data models for quotes
├── urls/
│   └── urls.dart               # API endpoint URLs
├── Homepage.dart               # Main UI for displaying quotes
├── main.dart                   # App entry point
└── old_Homepage.dart           # (Legacy/backup UI code)
```

### Key Files

- **main.dart:** Initializes the app and injects the BLoC.
- **Homepage.dart:** The main UI that displays quotes using BlocBuilder.
- **Api_Helper/api_helper.dart:** Makes HTTP GET requests and parses JSON.
- **Bloc/quotes_bloc.dart:** Handles events and business logic for fetching quotes.
- **Bloc/quotes_event.dart:** Defines the event(s) for the BLoC.
- **Bloc/quotes_state.dart:** Defines the possible UI states (loading, success, error).
- **data/model.dart:** Models for quotes data.
- **urls/urls.dart:** Contains the API endpoint.

## How It Works

1. On startup, the app dispatches a `GetQuotesEvent` to the `QuotesBloc`.
2. The BLoC uses `Api_helper` to fetch data from the URL defined in `urls.dart`.
3. The response is parsed into Dart objects (`QuotesDataModel`, `QuotesModel`).
4. The UI reacts to loading, success, or error states and displays appropriate widgets.
