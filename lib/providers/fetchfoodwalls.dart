import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants/frazile.dart';

/*
 * 1. set global data variables
 * 2. fetch data 
 * 3. fetch more data 
 * 4. merge more data to original data 
 */
class Walls with ChangeNotifier {
  Walls();

  // String _jsonResonse = "";
  bool _isFetching = false;
  bool _isLoading = false;
}
