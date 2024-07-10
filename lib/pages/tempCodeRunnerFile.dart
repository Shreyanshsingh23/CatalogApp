import 'dart:convert';

import 'package:flutter/services.dart';
loadData()async
{var catalogJson =await rootBundle.loadString("assets/files/catalog.json");
var decodedData = jsonDecode(catalogJson);}
