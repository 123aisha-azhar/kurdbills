import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_transfer_widget.dart' show BillTransferWidget;
import 'package:flutter/material.dart';

class BillTransferModel extends FlutterFlowModel<BillTransferWidget> {
  ///  Local state fields for this page.

  bool user = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<BilllsRecord>? bills;
  List<BilllsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
