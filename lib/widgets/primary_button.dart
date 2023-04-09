import 'package:flutter/material.dart';

import '../utils/color_util.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        color: ColorUtil.theme,
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
