import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.failureText, this.onPressed});

  final String failureText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(failureText),
        MaterialButton(
          onPressed: onPressed,
          child: const Text("حاول مرة اخرى"),
        )
      ],
    );
  }
}
