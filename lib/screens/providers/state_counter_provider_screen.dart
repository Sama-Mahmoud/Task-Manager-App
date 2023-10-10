//TODO: day 10 : intro to state management self study
// https://www.youtube.com/watch?v=0PkBIpMW54o&list=PL6yRaaP0WPkUf-ff1OX99DVSL1cynLHxO&index=3
// https://www.youtube.com/watch?v=sYhOf0HF3RQ&list=PL6yRaaP0WPkUf-ff1OX99DVSL1cynLHxO&index=4
// https://riverpod.dev/

//Android Studio Lovers : https://plugins.jetbrains.com/plugin/14641-flutter-riverpod-snippets

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flutter_proj/services/extension.dart';

import '../../managers/log_manager.dart';
import '../../widgets/my_app_bar.dart';

///[State Provider] => for simple state usage
///[.autoDispose]
///[ref.read]
///[ref.watch]
///[ref.listen]
/// [usage]=> i need to wrap my widget with Consumer =>

//normal StateProvider<int>
// final counterProvider = StateProvider<int>((_) {
//   return 0;
// });

final counterProvider = StateProvider<int>((_) => 0);

final vatCounterProvider = StateProvider<double>((ref) {
  //Value Added Cost
  return ref.watch(counterProvider) * (14 / 100);
});

// .autoDispose => auto dispose provider when not in use
// final counterProvider = StateProvider.autoDispose<int>((ref) {
//   return 0;
// });

class StateCounterProviderScreen extends StatelessWidget {
  const StateCounterProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LogManager.logToConsole("rebuilding Main Screen ");

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(title: "State Provider"),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const CircleProfileAvatar(),
              Consumer(
                builder: (context, ref, child) => Visibility(
                  visible: ref.watch(vatCounterProvider) >= 0.1,
                  child: Text(
                    ref.watch(vatCounterProvider).toStringAsFixed(2),
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 36),
                  ),
                ),
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  ref.listen(counterProvider, (previous, next) {
                    if (next > 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "You have exceeded your limits: max is $previous"),
                          showCloseIcon: true,
                          action: SnackBarAction(
                              label: "Reset",
                              onPressed: () => ref.invalidate(counterProvider)),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 250),
                          content: Text(
                              "Previous value was $previous, while the next value is $next"),
                          showCloseIcon: true,

                          
                        ),
                      );
                    }
                  });
                  LogManager.logToConsole(
                      "rebuilding Consumer with + number - ");
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (ref.read(counterProvider) > 10) return;
                            ref.read(counterProvider.notifier).state++;
                            LogManager.logToConsole(ref.read(counterProvider));
                            // ref.read(counterProvider.notifier).update((state) => state + 1);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.green,
                          )),
                      Text(
                        "${ref.watch(counterProvider)}", //String interpolation
                        style: context.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 80),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.read(counterProvider.notifier).state--;
                            LogManager.logToConsole(ref.read(counterProvider));
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 40,
                            color: Colors.red,
                          )),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
