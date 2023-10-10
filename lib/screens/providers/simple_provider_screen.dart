//TODO: day 10 : intro to state management self study
//! https://www.youtube.com/watch?v=0PkBIpMW54o&list=PL6yRaaP0WPkUf-ff1OX99DVSL1cynLHxO&index=3
//! https://www.youtube.com/watch?v=sYhOf0HF3RQ&list=PL6yRaaP0WPkUf-ff1OX99DVSL1cynLHxO&index=4
//! https://riverpod.dev/

//!Android Studio Lovers : https://plugins.jetbrains.com/plugin/14641-flutter-riverpod-snippets

// https://codewithandrea.com/articles/flutter-state-management-riverpod/
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/my_app_bar.dart';

final foodProvider = Provider<List<String>>((_) {
  return List.generate(50, (index) => Faker().food.dish());
});




///[Provider] => List of simple data
/// [usage]=> i need to wrap my widget with Consumer =>

class SimpleProviderScreen extends ConsumerWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(title: "Provider"),
      body: ListView.separated(
        itemCount: ref.read(foodProvider).length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        
        itemBuilder: (context, index) {
          var food = ref.read(foodProvider)[index];
          return Text(
            "${index + 1}- $food",
            style: Theme.of(context).textTheme.headlineSmall,
          );
        }, separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ),
    );
  }
}
