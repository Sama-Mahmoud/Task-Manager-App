import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flutter_proj/services/extension.dart';

import '../../managers/log_manager.dart';
import '../../widgets/my_app_bar.dart';


final counterChangeNotifierProvider =
    ChangeNotifierProvider<CounterChangeNotifier>((ref) {
  return CounterChangeNotifier();
});

class CounterChangeNotifier extends ChangeNotifier {
  CounterChangeNotifier();

  int count = 0;

  void increaseCounter() {
    count++;
    notifyListeners();
  }

  void decreaseCounter() {
    count--;
    notifyListeners();
  }

  double getVat() => (count * 0.14);
}

class ChangeNProviderScreen extends StatelessWidget {
  const ChangeNProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Change Notifier Provider"),
      body: Column(children: [
        Consumer(
          //?Implicit vs Explicit Animation
          builder: (context, ref, child) => AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: ref.watch(counterChangeNotifierProvider).getVat() >= 0.1
                ? 1
                : 0,
            child: Text(
              ref.watch(counterChangeNotifierProvider).count.toStringAsFixed(2),
              style: context.textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 36),
            ),
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            ref.listen((counterChangeNotifierProvider), (previous, next) {
              if (next.count > 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("You have exceeded your limits: max is $previous"),
                    showCloseIcon: true,
                    action: SnackBarAction(
                        label: "Reset",
                        onPressed: () =>
                            ref.invalidate(counterChangeNotifierProvider)),
                  ),
                );
              }
            });
            LogManager.logToConsole("rebuilding Consumer with + number - ");
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      if (ref.read(counterChangeNotifierProvider).count > 10) {
                        return;
                      }
                      ref.read(counterChangeNotifierProvider).increaseCounter();

                      // ref.read(counterProvider.notifier).update((state) => state + 1);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.green,
                    )),
                AnimatedScale(
                  scale: ref.watch(counterChangeNotifierProvider).count.isEven
                      ? 3
                      : 1,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  
                  child: Text(
                    "${ref.watch(counterChangeNotifierProvider).count}",
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 80),
                  ),
                ),
                IconButton(
                    onPressed: ref
                        .read(counterChangeNotifierProvider.notifier)
                        .decreaseCounter, //reference to the function
                    icon: const Icon(
                      Icons.remove,
                      size: 40,
                      color: Colors.red,
                    )),
              ],
            );
          },
        )
      ]),
    );
  }
}
