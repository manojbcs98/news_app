# news_app_manoj

#Overview
The News App is a Flutter-based mobile application designed to provide a seamless news browsing experience. 
It retrieves news articles from a remote API and presents them in a responsive grid layout.
Users can read detailed news content, bookmark articles, and enjoy smooth navigation transitions.

#Features
Grid View: Displays news articles in a responsive grid layout using GridView.builder.
News Detail: Allows users to tap on articles for detailed information.
Bookmarking: Users can save favourite articles with an interactive bookmark button.
Loading Indicator: Utilises a shimmer effect to indicate ongoing data loading.
Navigation Animation: Enhances user experience with Flutter's built-in page transition animations
Splash Screen: Provides an introductory screen with branding and loading animation while initialising the app.
Image Zooming: Implements a zoomable widget to allow users to zoom in on images within news articles.
Initial Loading Requirement: Requires an active internet connection for the initial data retrieval and display.


#Technologies Used
Flutter: Google's UI toolkit for building natively compiled applications across platforms.
Dart: Programming language used for Flutter app development.
Flutter Packages:
flutter_bloc: Implements BLoC (Business Logic Component) pattern for managing application state.
flutter_secure_storage: Safely stores sensitive information like API tokens.
shimmer: Provides loading indicators with shimmer effects.
Other standard Flutter and Dart libraries for UI components and asynchronous operations.

#Architecture and Implementation
BLoC Pattern: Uses Flutter Bloc library for state management, separating business logic from UI components.
Stateful Widget: NewsGridWidget manages UI updates, including bookmarked articles.
Model-View-Controller (MVC): Organises data (e.g., News model), business logic, and presentation layers.
API Integration: Retrieves news data from a remote endpoint (kNewsAppendUrlAPI) using dio, a Dart HTTP client.

#Pagination Handling
Approach: Implemented via lazy loading due to API constraints (e.g., 3 articles per page).
Initial Load: Loads a predefined number of articles on app startup.
Load More on Scroll: Dynamically fetches more articles as the user scrolls, responsibly managing API requests.

#Memory Optimization
Image Caching: Utilises Flutter's built-in image caching mechanisms to reduce memory usage and improve performance when loading and displaying images.