import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:to_do_list/utils/color_util.dart';
import 'package:to_do_list/utils/date_util.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
    this.checkBoxValue = false,
    this.onChanged,
    required this.title,
    required this.startDate,
    required this.endDate,
    this.onLongPress,
    this.onTap,
  }) : super(key: key);

  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final bool checkBoxValue;
  final void Function(bool?)? onChanged;
  final void Function()? onLongPress;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(minHeight: 150),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ToDoTime(
                          label: "Start Date",
                          time: DateUtil.formatMonthShortDate(startDate)),
                      ToDoTime(
                          label: "End Date",
                          time: DateUtil.formatMonthShortDate(endDate)),
                      ToDoTime(
                          label: "Time Left",
                          startDate: startDate,
                          endDate: endDate,
                          showTimer: true,
                          time: ''),
                    ],
                  ),
                ],
              ),
            ),
            // bottom part
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: ColorUtil.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text("Status",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.lightGray)),
                      const SizedBox(width: 10),
                      Text(
                        checkBoxValue ? 'Completed' : 'Incomplete',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: checkBoxValue
                                ? ColorUtil.orange
                                : Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: <Widget>[
                      const Text("Tick if completed",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                      const SizedBox(width: 10),
                      Container(
                          color: Colors.white,
                          height: 17.5,
                          width: 17.5,
                          child: Checkbox(
                              value: checkBoxValue, onChanged: onChanged))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDoTime extends StatelessWidget {
  const ToDoTime({
    Key? key,
    required this.label,
    this.time,
    this.showTimer = false,
    this.startDate,
    this.endDate,
  }) : super(key: key);

  final String label;
  final String? time;
  final bool showTimer;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    int? endTime;
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    if (startDate != null && startDate == today && endDate != null) {
      endTime = endDate!.millisecondsSinceEpoch;
      // if start & end day is same, add 23hours 59 minutes 59secs to end time
      if (startDate == today && endDate == today) {
        endTime = endDate!.millisecondsSinceEpoch + 84924000;
      }
    } else {
      endTime = 0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorUtil.lightGray)),
        const SizedBox(height: 10),
        if (showTimer)
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (BuildContext context, CurrentRemainingTime? time) {
              String days = time?.days != null ? '${time?.days} days ' : '';
              String hours = time?.hours != null ? '${time?.hours} hrs ' : '';
              String min =
                  days.isEmpty && time?.min != null ? '${time?.min} min ' : '';
              String sec = days.isEmpty && hours.isEmpty && time?.sec != null
                  ? '${time?.sec} sec'
                  : '';
              if (time == null) {
                return const Text('-');
              }
              return Text(
                '$days$hours$min$sec',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              );
            },
          )
        else
          Text(time ?? '',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
      ],
    );
  }
}
