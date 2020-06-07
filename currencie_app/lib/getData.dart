import 'dart:convert';
import 'dart:async';
import 'request.dart';

import 'package:http/http.dart' as http;

Future<Map> getData() async{
  http.Response response = await http.get(request);
  return json.decode(response.body);
}