import 'package:flutter/material.dart';
import 'package:howoldami/data/age/ageData.dart';
import 'package:howoldami/misc/locale.dart';

class ResultText extends StatelessWidget {
  const ResultText(this.ageData, {super.key});
  final AgeData ageData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ageData.age.toString(),
            style: Theme.of(context).textTheme.displayMedium),
        Text(lstr(context)!.result(ageData.name, ageData.age)),
      ],
    );
  }
}
