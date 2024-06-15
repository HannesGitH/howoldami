import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:howoldami/common/enums.dart';
import 'package:howoldami/misc/locale.dart';
import 'package:howoldami/routes/home/widgets/nameInput.dart';
import 'package:howoldami/routes/home/widgets/resultText.dart';

import 'homeModel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.read(homeModelProvider.notifier);
    final homeState = ref.watch(homeModelProvider);
    return Scaffold(
        // appBar: AppBar(
        //     // title: Text(lstr(context)!.title),
        //     ),
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          // as OneUI established once, actions should always be at the bottom
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: switch (homeState.progress) {
                  Progress.loading => SizedBox(
                      height: 20,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  Progress.error => Text(lstr(context)!.error_loading_age),
                  // XXX: one could add a side-scrollable history here, but not for this mvp
                  Progress.success => ResultText(homeState.age!),
                  _ => Container(),
                }),
            const Spacer(),
            NameInput(onSubmitted: homeModel.setName),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
