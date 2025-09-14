import '/components/back_iamge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'approved_bill_widget.dart' show ApprovedBillWidget;
import 'package:flutter/material.dart';

class ApprovedBillModel extends FlutterFlowModel<ApprovedBillWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backIamge component.
  late BackIamgeModel backIamgeModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    backIamgeModel = createModel(context, () => BackIamgeModel());
  }

  @override
  void dispose() {
    backIamgeModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
