import 'package:flutter/foundation.dart' show immutable;

@immutable
class ChoosenButton {
  final bool isSelected;
  final int id;

  const ChoosenButton(
      {required this.isSelected, required this.id});

  ChoosenButton copyWithToggleSection(bool newSelection) =>
      ChoosenButton(isSelected: newSelection,id: id);
}
