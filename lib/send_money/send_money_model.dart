import '/backend/backend.dart';
import '/components/back_iamge_widget.dart';
import '/components/upload_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'send_money_widget.dart' show SendMoneyWidget;
import 'package:flutter/material.dart';

class SendMoneyModel extends FlutterFlowModel<SendMoneyWidget> {
  ///  Local state fields for this page.

  bool imageVisibility = true;

  ///  State fields for stateful widgets in this page.

  // Model for backIamge component.
  late BackIamgeModel backIamgeModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BankDetailsRecord? singleBankdata;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  BilllsRecord? recepit;
  // Model for uploadImage component.
  late UploadImageModel uploadImageModel;
  bool isDataUploading_uploadDataIvr = false;
  FFUploadedFile uploadedLocalFile_uploadDataIvr =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataIvr = '';

  @override
  void initState(BuildContext context) {
    backIamgeModel = createModel(context, () => BackIamgeModel());
    uploadImageModel = createModel(context, () => UploadImageModel());
  }

  @override
  void dispose() {
    backIamgeModel.dispose();
    uploadImageModel.dispose();
  }
}
