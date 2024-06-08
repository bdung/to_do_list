import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/controller/get_data_task_day.dart';
import 'package:to_do_list/model/task_model.dart';
import 'package:to_do_list/utils/enums.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  GetDataTaskDay getDataTaskDay = GetDataTaskDay();
  List<Task> taskList = [];
  List<Task> taskListOfWeek = [];
  HomeBloc() : super(const HomeState()) {
    on<FetchDataTask>(_fetchData);
    on<CompletedTaskEvent>(_completedTask);
    on<WriteDataEvent>(_writeData);
    on<RemoveTaskEvent>(_removeTask);
    on<FetchDataTaskOfDayEvent>(_fetchDataOfDay);
    on<FetchDataTaskOfWeekEvent>(_fetchDataOfWeek);
    on<SearchTaskEvent>(_searchTask);
  }

  void _fetchData(FetchDataTask event, Emitter<HomeState> emit) async {

    await getDataTaskDay.fetchData().then((value) {

      value.sort((a, b) {
      int dateComparison = a.dateCreated.toString().compareTo(b.dateCreated.toString());
      if (dateComparison != 0) {
      return dateComparison;
      } else {
      return a.timeCreated.toString().compareTo(b.timeCreated.toString());
      }
      });
      emit(state.copyWith(
          postStatus: PostStatus.success, message: 'success', listTodayTasks: List.from(value)));
    }).onError(
          (error, stackTrace) {
        emit(state.copyWith(
            postStatus: PostStatus.failure, message: error.toString()));
      },
    );
    // ignore: invalid_use_of_visible_for_testing_member
  }
  void _fetchDataOfDay(FetchDataTaskOfDayEvent event, Emitter<HomeState> emit) async {

    await getDataTaskDay.fetchData().then((value) {
      value.sort((a, b) {
        int dateComparison = a.dateCreated.toString().compareTo(b.dateCreated.toString());
        if (dateComparison != 0) {
          return dateComparison;
        } else {
          return a.timeCreated.toString().compareTo(b.timeCreated.toString());
        }
      });
      taskList = value.where((element) => element.dateCreated == event.date).toList();

      emit(state.copyWith(
          postStatus: PostStatus.success, message: 'success', listTodayTasks: taskList));
    }).onError(
          (error, stackTrace) {
        emit(state.copyWith(
            postStatus: PostStatus.failure, message: error.toString()));
      },
    );
    // ignore: invalid_use_of_visible_for_testing_member
  }
  DateTime findFirstDateOfTheWeek(DateTime dateTime, int index) {
    return dateTime.subtract(Duration(days: dateTime.weekday - index));
  }
  Future<void> getListTaskOfTheWeek(DateTime dateTime) async{
    for(int i = 1; i < 8; i++){
      String date = "${DateFormat.yMMMd().format(findFirstDateOfTheWeek(dateTime, i))}";
      print("date: " + date);
      await getDataTaskDay.fetchData().then((value) {

        taskListOfWeek.addAll(value.where((element) => element.dateCreated == date).toList());
      });
      print("task list: " + taskListOfWeek[0].title!);
    }
  }
  void _fetchDataOfWeek(FetchDataTaskOfWeekEvent event, Emitter<HomeState> emit) async {
    await getListTaskOfTheWeek(event.date);
    emit(state.copyWith(
        postStatus: PostStatus.success, message: 'success', listTodayTasks: taskListOfWeek));
    // ignore: invalid_use_of_visible_for_testing_member
  }

  void _writeData(WriteDataEvent event, Emitter<HomeState> emit) async {
    taskList = await getDataTaskDay.fetchData();
    taskList.add(event.task);
    await getDataTaskDay.writeJsonFile(taskList);
    emit(state.copyWith(listTodayTasks: List.from(taskList)));
    // ignore: invalid_use_of_visible_for_testing_member
  }
  Future<void> updateTask(Task task) async{
    for (var element in taskList) {
      if (element.id == task.id) {
        element.isCompleted = task.isCompleted;
        print("Updated successfully");
        return;
      }
    }
  }
  void _completedTask(CompletedTaskEvent event, Emitter<HomeState> emit) async{
    await updateTask(event.task);
    await getDataTaskDay.writeJsonFile(taskList);
    emit(state.copyWith(listTodayTasks: List.from(taskList)));
    // ignore: invalid_use_of_visible_for_testing_member
  }
  void _removeTask(RemoveTaskEvent event, Emitter<HomeState> emit) async {
    taskList.remove(event.task);
    await getDataTaskDay.writeJsonFile(taskList);
    emit(state.copyWith(listTodayTasks: List.from(taskList)));
    // ignore: invalid_use_of_visible_for_testing_member
  }
  Future<List<Task>> searchItem(String keySearch) async{
    final List<Task> listTask;
    try {
      var result = taskList.where((task) => task.title.toString().toLowerCase().contains(keySearch.toLowerCase())
          || task.dateCreated.toString().toLowerCase().contains(keySearch.toLowerCase())
          || task.timeCreated.toString().toLowerCase().contains(keySearch.toLowerCase()));
      listTask = result.toList();
      return listTask;
    } catch (e) {
      print("Error reading JSON file: $e");
      return [];
    }
  }
  void _searchTask(SearchTaskEvent event, Emitter<HomeState> emit) async {
    await searchItem(event.keySearch).then((value) => {
      if(value.isNotEmpty){
        emit(state.copyWith(
            postStatus: PostStatus.success, message: 'success', listTodayTasks: List.from(value)))
      }else{
    emit(state.copyWith(postStatus: PostStatus.failure, message: "failure"))
    }

    });
  }
}
