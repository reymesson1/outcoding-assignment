
# Cat Image Viewer App

## Overview
This SwiftUI app fetches cat images from the [Cataas API](https://cataas.com/) and displays them in a list. Users can view each cat image in detail, including tags associated with the image.

![image](https://github.com/reymesson1/outcoding-assignment/assets/30162161/63ac6375-68c9-4729-97d7-b197b9bbb7ac)


## Features
- Fetches cat images from the Cataas API.
- Displays a list of cat images with navigation to view details.
- Shows each cat image's tags in detail view.

## Technologies Used
- **SwiftUI**: SwiftUI is used to build the user interface of the app. It provides a modern and declarative approach to creating UIs.
- **Combine Framework**: Combine is used for handling asynchronous events and data streams, such as fetching data from the API and updating the UI accordingly.
- **URLSession**: URLSession is used for making network requests to fetch cat images from the Cataas API.
- **JSON Decoding**: Codable protocols are used for decoding JSON data received from the API into Swift data structures.
- **Navigation View**: SwiftUI's NavigationView and NavigationLink are used for navigation between different views within the app.

## Methodology
- **MVVM Architecture**: The app follows the Model-View-ViewModel (MVVM) architecture pattern, separating concerns between data/model (CatImage), UI (View), and data presentation/business logic (CatViewModel).
- **ObservableObject**: CatViewModel is marked as an ObservableObject to allow it to publish changes to its properties, which are then observed by views.
- **Asynchronous Data Fetching**: Data fetching from the API is performed asynchronously to avoid blocking the main thread and ensure smooth user experience.
- **Remote Image Loading**: RemoteImage view asynchronously loads and displays cat images fetched from the Cataas API.

## Usage
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device.
4. Explore the list of cat images fetched from the Cataas API.
5. Tap on a cat image to view its details, including tags.

## Future Improvements
- **Error Handling**: Implement better error handling for cases such as network errors or failed data decoding.
- **Pagination**: Implement pagination to fetch and display more cat images as the user scrolls.
- **Image Caching**: Implement image caching to improve performance and reduce redundant network requests.
- **UI Enhancements**: Add more visually appealing UI elements and animations to enhance the user experience.
- **Localizable**: Add more languages to show the app more internationality and give the user a better experience.


## License
This project is licensed under the [MIT License](LICENSE).
