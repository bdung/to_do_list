import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:to_do_list/model/task_model.dart';

@immutable
abstract class HomeEvent {
  HomeEvent();
}

class FetchDataTask extends HomeEvent {}
class FetchDataTaskOfDayEvent extends HomeEvent {
  final String date;
  FetchDataTaskOfDayEvent({required this.date});

  @override
  List<Object> get props => [date];
}class FetchDataTaskOfWeekEvent extends HomeEvent {
  final DateTime date;
  FetchDataTaskOfWeekEvent({required this.date});

  @override
  List<Object> get props => [date];
}

class WriteDataEvent extends HomeEvent {
  final Task task;
  WriteDataEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends HomeEvent {
  final Task task;
  RemoveTaskEvent({required this.task});
  List<Object> get props=> [task];
}

class CompletedTaskEvent extends HomeEvent {
  final Task task;
  CompletedTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
class SearchTaskEvent extends HomeEvent {
  final String  keySearch;
  SearchTaskEvent({required this.keySearch});

  @override
  List<Object> get props => [keySearch];
}
