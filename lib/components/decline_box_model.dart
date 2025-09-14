import '/flutter_flow/flutter_flow_util.dart';
import 'decline_box_widget.dart' show DeclineBoxWidget;
import 'package:flutter/material.dart';

class DeclineBoxModel extends FlutterFlowModel<DeclineBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
