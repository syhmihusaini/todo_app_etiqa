
# To-Do List (Flutter App)
➤ The app’s state management, navigation & dependencies management is rely on [GetX Package](https://pub.dev/packages/get) and [Shared Preferences](https://pub.dev/packages/shared_preferences) for local storage.


## Screenshots

![Simulator Screen Shot - iPhone![Simulator Screen Shot - iPhone 13 - 2023-04-09 at 10 12 52](https://user-images.githubusercontent.com/82700832/230751575-0e6578ec-ee34-4808-a135-4151fd8dc5a8.png)
![Simulator Screen Shot - iPhone 13 - 2023-04-09 at 10 13 24](https://user-images.githubusercontent.com/82700832/230751577-b37b4948-dbf6-49a0-bee4-3ca44304ec86.png)
![Simulator Screen Shot - iPhone 13 - 2023-04-09 at 10 13 30](https://user-images.githubusercontent.com/82700832/230751580-000fdda4-dc15-4db2-9983-4ef2988ccf74.png)
![Simulator Screen Shot - iPhone 13 - 2023-04-09 at 10 13 38](https://user-images.githubusercontent.com/82700832/230751581-8e147289-6e78-4245-9f4c-27d6dc23c2d9.png)
![Simulator Screen Shot - iPhone 13 - 2023-04-09 at 10 14 05](https://user-images.githubusercontent.com/82700832/230751582-04b21181-7287-4741-9e34-7ddb359db076.png)
 13 - 2023-04-09 at 10 12 44](https://user-images.githubusercontent.com/82700832/230751572-9f98df32-21e7-4d5e-88c4-d66972d192b0.png)


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
