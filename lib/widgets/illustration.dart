import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/utils/color_util.dart';

class ToDoIllustration extends StatelessWidget {
  const ToDoIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/illustrations/todo.svg', height: 350, width: 350),
          const SizedBox(height: 10),
          const Text('Create To Do List Now', style: TextStyle(color: ColorUtil.lightGray, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
