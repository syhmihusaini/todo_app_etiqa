
# To-Do List (Flutter App)
➤ The app’s state management, navigation & dependencies management is rely on [GetX Package](https://pub.dev/packages/get) and [Shared Preferences](https://pub.dev/packages/shared_preferences) for local storage.


## Screenshots
<img width="418" alt="Screenshot 2023-04-09 at 10 56 17 AM" src="https://user-images.githubusercontent.com/82700832/230751732-84658701-4f87-4ef1-a5eb-bf641d2d493d.png">



## Key Features
 - Create To-Do
 - Edit To-Do
 - Delete To-Do
 - Mark To-Do as Complete 

## Simple validations:
- Title must not be empty
- Start date must be smaller than or equal to end date
- End Date must be larger than or equal to start date
 

## Project Architecture
- [GetX Pattern by kauemurakami](https://github.com/kauemurakami/getx_pattern)
- Project Structure:
```bash
├── lib
│   ├── data
│   │    └── local_storage
│   │    └── models
│   ├── modules
│   │    └── to_do_list
│   │         └── bindings
│   │         └── controllers
│   │         └── views
│   ├── routes
│   └── utils
│   └── widgets 
│     
└── test
```
## Unit Test

- Simple unit tests are created
- To execute all the unit tests, run
```bash
flutter test   
```



## Setup Project
- To run the app, simply write
```bash
install flutter
1.https://docs.flutter.dev/get-started/install
```
```bash
2.flutter pub get  
```
```bash
3.flutter run --no-sound-null-safety
```
