import '/components/back_iamge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pending_and_progress_widget.dart' show PendingAndProgressWidget;
import 'package:flutter/material.dart';

class PendingAndProgressModel
    extends FlutterFlowModel<PendingAndProgressWidget> {
  ///  Local state fields for this page.

  bool buttonDisable = false;

  ///  State fields for stateful widgets in this page.

  // Model for backIamge component.
  late BackIamgeModel backIamgeModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in AdminButton widget.
  bool? disable;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? declinedisable;

  @override
  void initState(BuildContext context) {
    backIamgeModel = createModel(context, () => BackIamgeModel());
  }

  @override
  void dispose() {
    backIamgeModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
