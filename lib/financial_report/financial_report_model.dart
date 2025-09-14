import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'financial_report_widget.dart' show FinancialReportWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class FinancialReportModel extends FlutterFlowModel<FinancialReportWidget> {
  ///  Local state fields for this page.

  List<BilllsRecord> data = [];
  void addToData(BilllsRecord item) => data.add(item);
  void removeFromData(BilllsRecord item) => data.remove(item);
  void removeAtIndexFromData(int index) => data.removeAt(index);
  void insertAtIndexInData(int index, BilllsRecord item) =>
      data.insert(index, item);
  void updateDataAtIndex(int index, Function(BilllsRecord) updateFn) =>
      data[index] = updateFn(data[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in FinancialReport widget.
  List<BilllsRecord>? allBillCategories;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Bottom Sheet - SubAdmin] action in ChoiceChips widget.
  DocumentReference? adminRef;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
