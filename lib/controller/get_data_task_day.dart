import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/model/task_model.dart';

class GetDataTaskDay {
  Future<List<Task>> fetchData() async {
    final List<Task> listTask;
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/dataCustomer.json';
      File file = File(filePath);
      String response = "";
      response = await file.readAsString();
         // rootBundle.loadString('lib/assets/data_json.json');
      print("Read data successfully");
      final data = await json.decode(response) as List;

      listTask = data.map((e) => Task.fromJson(e)).toList();
      return listTask;
    } catch (e) {
      print("Error reading JSON file: $e");
      return [];
    }
  }

  List<Map<String, dynamic>> dataListToJson(List<Task> dataList) {
    List<Map<String, dynamic>> jsonList = [];
    dataList.forEach((data) {
      jsonList.add(data.toJson());
    });
    return jsonList;
  }

  Future<void> writeJsonFile(List<Task> listTask) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath ='${directory.path}/dataCustomer.json';
      print('Data written to file successfully');
      final file = File(filePath);

      List<Map<String, dynamic>> jsonDataList = dataListToJson(listTask);
      final jsonData = jsonEncode(jsonDataList);
      await file.writeAsString(jsonData);
      print('Data written to file successfully');
    } catch (e) {
      print('Error writing to file: $e');
    }
  }
}
