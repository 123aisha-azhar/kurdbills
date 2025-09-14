// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:uuid/uuid.dart';

Future<int> generateBillId() async {
  // Generate a UUID and convert its hashCode to an integer ID
  final uuid = Uuid();
  final String newUUID = uuid.v4();
  final int billId = newUUID.hashCode.abs(); // Ensure it's positive
  return billId;
}
