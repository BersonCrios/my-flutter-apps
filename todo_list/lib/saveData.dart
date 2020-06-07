import 'dart:convert';
import 'dart:io';
import 'getFile.dart';

Future<File> saveData(List todoList) async {
  String data = json.encode(todoList);
  final file = await getFile();
  return file.writeAsString(data);
}