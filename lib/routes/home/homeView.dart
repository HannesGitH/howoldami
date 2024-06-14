import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:howoldami/routes/home/widgets/nameInput.dart';
import 'package:howoldami/routes/home/widgets/resultText.dart';

import 'homeModel.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.read(homeModelProvider.notifier);
    final homeState = ref.watch(homeModelProvider);
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text(lstr(context)!.title),
        // ),
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // as OneUI estblished once, actions should always be at the bottom
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (homeState.age != null)
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, top: 30, left: 8, right: 8),
              child: ResultText(homeState.age!),
            ),
          const Spacer(),
          NameInput(onSubmitted: homeModel.setName),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
