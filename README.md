
# To-Do List (Flutter App)
➤ The app’s state management, navigation & dependencies management is rely on [GetX Package](https://pub.dev/packages/get) and [Shared Preferences](https://pub.dev/packages/shared_preferences) for local storage.


## Screenshots


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
- Clone repository
```bash
git clone https://github.com/weeyc/to-do-list.git  
```

- To run the app, simply write
```bash
flutter pub get  
```
```bash
flutter run 
```
