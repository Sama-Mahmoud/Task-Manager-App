import 'package:adaptive_dialog/adaptive_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';

import '../constants/route_constants.dart';
import '../managers/log_manager.dart';
import '../models/tasks.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_home_card.dart';

//TODO: Day 12 dart run flutter_native_splash:create --path=flutter_native_splash.yaml

// final totalAmountProvider = Provider<double>((ref) {
//   return ref.watch(propertiesStateNotifierProvider).fold(
//       0, (previousValue, element) => (element.price ?? 0) + previousValue);
// });

final propertiesStateNotifierProvider =
StateNotifierProvider<PropertiesNotifier, List<Tasks>>((ref) {
  return PropertiesNotifier();
});

// final sortedPropertiesProvider = Provider<List<Property>>((ref) {
//   var sortedList = ref.read(propertiesStateNotifierProvider);

//   sortedList.sort((a, b) {
//     var sortedA = a.isFav == true ? 1 : 0;
//     var sortedB = b.isFav == true ? 1 : 0;
//     return sortedA.compareTo(sortedB);
//   });

//   return sortedList;
// });

class PropertiesNotifier extends StateNotifier<List<Tasks>> {
  PropertiesNotifier() : super(Tasks.dummytasks);

  // void addProperty({required Tasks newProperty}) {
  //   state = [...state, newProperty];
  // }
  //
  // void deleteProperty({required String? deletedPropertyID}) {
  //   state = [
  //     for (final property in state)
  //       if (property.uID == deletedPropertyID) null else property
  //   ].nonNulls.toList();
  // }

// void addToFav(
//     Property selectedProp,
//   ) {
//     state = [
//       for (final property in state)
//         if (property.uID == selectedProp.uID)
//           selectedProp.copyWithNewFavStatus(!((selectedProp.isFav) ?? false))
//         else
//           property
//     ];
//   }

  void addToFavourite(
      Tasks selectedTask,
      ) {
    state = [
      for (final task in state)
        if (task.uID == selectedTask.uID)
          selectedTask.copyWith(newStatus: true)
        else
          task
    ];
  }

  void removeToFavourite(
      Tasks selectedProp,
      ) {
    state = [
      for (final property in state)
        if (property.uID == selectedProp.uID)
          selectedProp.copyWith(newStatus: false)
        else
          property
    ];
  }

// void updatePrice(Tasks selectedProp, double? newPrice) {
//   state = [
//     for (final property in state)
//       if (property.uID == selectedProp.uID)
//         selectedProp.copyWith(price: newPrice)
//       else
//         property
//   ];
// }
}

class TasksList extends ConsumerWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return Flexible(
      child: SizedBox(
        height: size.height * 0.45,

        child: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          primary: false,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: ref.watch(propertiesStateNotifierProvider).length,
          separatorBuilder: (BuildContext context, int index) {
            return Padding(padding: EdgeInsets.only(right: 7));
          },
          itemBuilder: (BuildContext context, int index) {
            var property = ref.read(propertiesStateNotifierProvider)[index];
            return Dismissible(
              key: ValueKey(property.uID),
              // confirmDismiss: (direction) =>
              //     Future.value(direction == DismissDirection.endToStart),
              // onDismissed: (direction) {
              //   if (direction == DismissDirection.endToStart) {
              //     ref
              //         .read(propertiesStateNotifierProvider.notifier)
              //         .deleteProperty(deletedPropertyID: property.uID);
              //   }
              // },
              // child: InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(
              //         RouteConstants.propertyDetailsRouteName,
              //         arguments: property);
              //   },
              child: MyHomeCard(
                task: property,
                onTaskTapped: (status) {
                  if (status) {
                    ref
                        .read(propertiesStateNotifierProvider.notifier)
                        .removeToFavourite(property);
                  } else {
                    ref
                        .read(propertiesStateNotifierProvider.notifier)
                        .addToFavourite(property);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
