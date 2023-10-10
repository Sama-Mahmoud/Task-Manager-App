import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/my_app_bar.dart';

final areasProvider = StateProvider<List<String>>((_) {
  return List.generate(6, (index) => Faker().address.country());
});

final hasAcceptTermsProvider = StateProvider<bool>((ref) {
  return false;
});
// I can hear you

class StateListProviderScreen extends ConsumerWidget {
  const StateListProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: "Provider",
        height: 70,
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, _) => IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showTextInputDialog(context: context, textFields: [
                  const DialogTextField(hintText: "Enter name")
                ]).then((value) {
                  if (value == null) return;
                  ref.read(areasProvider.notifier).update(
                        (state) => [...state, value.first],
                        // return
                      );
                });
                // ref.read(areasProvider.notifier).update((state) {
                //   // return
                // });
                // print(ref.read(areasProvider).length);
              },
            ),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, _) => IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                showTextInputDialog(
                    context: context,
                    okLabel: "delete",
                    isDestructiveAction: true,
                    textFields: [
                      const DialogTextField(hintText: "Enter to delete")
                    ]).then((enteredArea) {
                  if (enteredArea == null) return;
                  ref.read(areasProvider.notifier).update(
                        (state) => [
                          for (var area in state)
                            if (enteredArea.first != area) area
                        ],
                        // return
                      );
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(ref.watch(areasProvider).length.toString()),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ListView.builder(
                itemCount: ref.watch(areasProvider).length,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemExtent: 40,
                itemBuilder: (context, index) {
                  var area = ref.watch(areasProvider)[index];
                  return Text(
                    "${index + 1}- $area",
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                },
              );
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                CheckboxListTile(
              value: ref.watch(hasAcceptTermsProvider),
              onChanged: (newStatus) {
                ref.read(hasAcceptTermsProvider.notifier).state = newStatus ?? false;
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Accept terms and condtions"),
            ),
          ),

          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child)=>
           ElevatedButton(onPressed:ref.watch(hasAcceptTermsProvider)?(){}:null  , child: const Text("Submit"))),
        
        ],
      ),
    );
  }
}
