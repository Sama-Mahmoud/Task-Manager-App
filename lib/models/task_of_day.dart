import 'package:flutter/foundation.dart' show immutable;

@immutable
class TaskDay {
  final bool isSelected;
  final String Taskname;
  final String time;
  final String? duration;
  final String? imgname;
  final String? jobposition;
  final int id;

  const TaskDay(
      {required this.isSelected,
        required this.Taskname,
        required this.time,
        this.duration,
        this.imgname,
        this.jobposition,
        required this.id});

  TaskDay copyWithToggleSection(bool newSelection ) =>
      TaskDay(isSelected: newSelection, Taskname: Taskname ,id: id,time:time);

  TaskDay newDayTask( String Taskname2 , String time2) =>
      TaskDay(isSelected: isSelected, Taskname: Taskname2 ,id: id,time:time2);
}
