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

import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future makePDF(List<BilllsRecord> billData) async {
  // Add your function code here!
  final pdf = pw.Document();
  // 1. Fetch all user details first
  List<List<dynamic>> tableData = [];
  for (var e in billData) {
    final docSnapshot = await e.adminHowHandle!.get();
    final user = UserRecord.fromSnapshot(docSnapshot);

    tableData.add([
      e.completedDate?.toString() ?? '',
      "${user.displayName} ${user.phoneNumber}" ?? '',
      e.billAmount.toString(),
      e.billFee ?? '',
    ]);
  }

  // 2. Now use tableData in PDF
  // Add Title
  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Financial Report",
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: ["Date", "SubAdmin", "Amount", "Fee", "Category"],
              data: tableData,
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.centerLeft,
            ),
          ],
        );
      },
    ),
  );

  // Save & Share PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
