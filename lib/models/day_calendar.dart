import 'package:flutter/foundation.dart' show immutable;

@immutable
class DayCalender {
  final bool isSelected;
  final DateTime date;
  final int id;

  const DayCalender(
      {required this.isSelected, required this.date, required this.id});

  DayCalender copyWithToggleSection(bool newSelection) =>
      DayCalender(isSelected: newSelection, date: date,id: id);
}
