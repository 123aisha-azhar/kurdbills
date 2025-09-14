import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData7q6 = false;
  FFUploadedFile uploadedLocalFile_uploadData7q6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData7q6 = '';

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ux62bglm' /* Enter your user name is requir... */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ufvtasvj' /* email is required */,
      );
    }

    return null;
  }

  // State field(s) for NumCode widget.
  FocusNode? numCodeFocusNode;
  TextEditingController? numCodeTextController;
  String? Function(BuildContext, String?)? numCodeTextControllerValidator;
  String? _numCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qcwon20z' /* Enter your phone number code i... */,
      );
    }

    return null;
  }

  // State field(s) for phoneNum widget.
  FocusNode? phoneNumFocusNode;
  TextEditingController? phoneNumTextController;
  String? Function(BuildContext, String?)? phoneNumTextControllerValidator;
  String? _phoneNumTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bw6738l7' /* Enter your phone number is req... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    numCodeTextControllerValidator = _numCodeTextControllerValidator;
    phoneNumTextControllerValidator = _phoneNumTextControllerValidator;
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    numCodeFocusNode?.dispose();
    numCodeTextController?.dispose();

    phoneNumFocusNode?.dispose();
    phoneNumTextController?.dispose();
  }
}
