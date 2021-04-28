import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String firstDate;
  final String secDate;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedFirstDate;
  final ValueChanged<String> onChangedSecDate;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.firstDate = '',
    this.secDate = '',
    @required this.onChangedTitle,
    @required this.onChangedFirstDate,
    @required this.onChangedSecDate,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 20),
          buildFirstDate(),
          SizedBox(height: 20),
          buildSecDate(),
          SizedBox(height: 16),
          buildButton(),
        ],
      ),
      )
      );

  Widget buildTitle() => TextFormField(
        maxLines: 3,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          labelText: 'To-Do Title',
        ),
      );
  Widget buildFirstDate() => TextFormField(
    maxLines: 1,
    initialValue: firstDate,
    onChanged: onChangedFirstDate,
    validator: (firstDate) {
      if (firstDate.isEmpty) {
        return 'The field cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: 'DD/MM/YY',
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(),
      ),
      labelText: 'Start Date',
    ),
  );


  Widget buildSecDate() => TextFormField(
    maxLines: 1,
    initialValue: secDate,
    onChanged: onChangedSecDate,
    validator: (secDate) {
      if (secDate.isEmpty) {
        return 'The field cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(),
      ),
      labelText: 'End Date',
    ),
  );

  // Widget buildFirstDate() => DateTimeFormField(
  //   decoration: const InputDecoration(
  //     hintStyle: TextStyle(color: Colors.black45),
  //     errorStyle: TextStyle(color: Colors.redAccent),
  //     border: OutlineInputBorder(),
  //     suffixIcon: Icon(Icons.event_note),
  //     labelText: 'Start Date',
  //   ),
  //   mode: DateTimeFieldPickerMode.dateAndTime,
  //   autovalidateMode: AutovalidateMode.always,
  //   validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
  //   onDateSelected: (DateTime value) {
  //     print(value);
  //   },
  //   onSaved: onChangedSecDate,
  // );

  // Widget buildSecDate() => DateTimeFormField(
  //   decoration: const InputDecoration(
  //     hintStyle: TextStyle(color: Colors.black45),
  //     errorStyle: TextStyle(color: Colors.redAccent),
  //     border: OutlineInputBorder(),
  //     suffixIcon: Icon(Icons.event_note),
  //     labelText: 'End Date',
  //   ),
  //   mode: DateTimeFieldPickerMode.dateAndTime,
  //   autovalidateMode: AutovalidateMode.always,
  //   validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
  //   onDateSelected: (DateTime value) {
  //     print(value);
  //   },
  // );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          onPressed: onSavedTodo,
          child: Text('Create Now'),
        ),
      );
}
